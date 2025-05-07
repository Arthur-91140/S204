SET SERVEROUTPUT ON;

SELECT TO_CHAR(SUM(note)) || '/20' AS note
FROM NOTE_AUTO_S204;

SELECT *
FROM NOTE_AUTO_S204;

--Ajout de la permition de consultation à AnalyseJV
BEGIN
  FOR tab IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(tab.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT ON ' || tab.table_name || ' TO AnalyseJV';
  END LOOP;
END;
/

--Ajout de la permition de consultation et modification à GestionJV
BEGIN
  FOR tab IN (SELECT table_name FROM user_tables) LOOP
    DBMS_OUTPUT.PUT_LINE(tab.table_name);
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || tab.table_name || ' TO GestionJV';
  END LOOP;
END;
/

CREATE VIEW FICHE_JEU AS
SELECT 
    j.IdJeu AS identifiant,
    j.TitreJeu AS titre,
    (SELECT MIN(DateSortie) 
     FROM DATESORTIE 
     WHERE IdJeu = j.IdJeu AND DateSortie IS NOT NULL) AS premiere_date_sortie,
    COALESCE(j.StatutJeu, 'Publié') AS statut,
    COALESCE(
        (SELECT LISTAGG(c.NomCompagnie, ', ') WITHIN GROUP (ORDER BY c.NomCompagnie)
         FROM COMPAGNIEJEU cj
         JOIN COMPAGNIE c ON cj.IdCompagnie = c.IdCompagnie
         WHERE cj.IdJeu = j.IdJeu AND cj.EstDeveloppeur = 1), 
    '') AS developpeurs,
    COALESCE(
        (SELECT LISTAGG(g.NomGenre, ', ') WITHIN GROUP (ORDER BY g.NomGenre)
         FROM GENREJEU gj
         JOIN GENRE g ON gj.IdGenre = g.IdGenre
         WHERE gj.IdJeu = j.IdJeu), 
    '') AS genres,
    COALESCE(
        (SELECT LISTAGG(p.NomPlateforme, ', ') WITHIN GROUP (ORDER BY p.NomPlateforme)
         FROM DATESORTIE ds
         JOIN PLATEFORME p ON ds.IdPlateforme = p.IdPlateforme
         WHERE ds.IdJeu = j.IdJeu), 
    '') AS plateformes,
    ROUND(CAST(j.ScoreJeu AS NUMERIC), 2) AS score_utilisateur,
    ROUND(CAST(j.ScoreIGDB AS NUMERIC), 2) AS score_critique
FROM JEU j;


CREATE VIEW SORTIES_RECENTES AS
SELECT j.IdJeu, j.TitreJeu AS Titre, ds.DateSortie AS DateDeSortie, LISTAGG(p.NomPlateforme, ', ') WITHIN GROUP (ORDER BY p.NomPlateforme) AS Plateformes
FROM JEU j
JOIN DATESORTIE ds ON j.IdJeu = ds.IdJeu
JOIN PLATEFORME p ON ds.IdPlateforme = p.IdPlateforme
WHERE ds.DateSortie <= SYSDATE
GROUP BY j.IdJeu, j.TitreJeu, ds.DateSortie
ORDER BY ds.DateSortie DESC, j.TitreJeu ASC;



CREATE FUNCTION FICHE_DETAILLEE (
  p_id_jeu IN JEU.IdJeu%TYPE
) RETURN CLOB
IS
  l_count INTEGER;
  l_json  CLOB;
BEGIN

  SELECT COUNT(*)
    INTO l_count
    FROM JEU
   WHERE IdJeu = p_id_jeu;

  IF l_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
  END IF;

  SELECT JSON_OBJECT(
           'titre'           VALUE j.TitreJeu,
           'résumé'          VALUE j.ResumeJeu,
           'mode(s) de jeu'  VALUE (
             SELECT JSON_ARRAYAGG(m.NomModalite ORDER BY m.IdModalite)
               FROM MODALITEJEU mj
               JOIN MODALITE      m ON mj.IdModalite = m.IdModalite
              WHERE mj.IdJeu = p_id_jeu
           ),
           'développeur(s)'  VALUE (
             SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                        'id'   VALUE c.IdCompagnie    FORMAT JSON,
                        'nom'  VALUE c.NomCompagnie
                      )
                      ORDER BY c.NomCompagnie
                    )
               FROM COMPAGNIEJEU cj
               JOIN COMPAGNIE     c ON cj.IdCompagnie = c.IdCompagnie
              WHERE cj.IdJeu = p_id_jeu
                AND cj.EstDeveloppeur = 1
           ),
           'publieur(s)'     VALUE (
             SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                        'id'   VALUE c.IdCompagnie    FORMAT JSON,
                        'nom'  VALUE c.NomCompagnie
                      )
                      ORDER BY c.NomCompagnie
                    )
               FROM COMPAGNIEJEU cj
               JOIN COMPAGNIE     c ON cj.IdCompagnie = c.IdCompagnie
              WHERE cj.IdJeu = p_id_jeu
                AND cj.EstPublieur   = 1
           ),
           'plateforme(s)'   VALUE (
             SELECT JSON_ARRAYAGG(
                      JSON_OBJECT(
                        'nom'          VALUE p.NomPlateforme,
                        'date sortie'  VALUE TO_CHAR(ds.DateSortie, 'DD/MM/YY'),
                        'statut'       VALUE NVL(ds.StatutSortie, 'Full release')
                      )
                      ORDER BY p.NomPlateforme, ds.DateSortie
                    )
               FROM DATESORTIE     ds
               JOIN PLATEFORME     p  ON ds.IdPlateforme = p.IdPlateforme
              WHERE ds.IdJeu = p_id_jeu
           ),
           'score'            VALUE TO_CHAR(j.ScoreJeu,        'FM90.999999999999'),
           'nb votes'         VALUE TO_CHAR(j.NombreNotesJeu),
           'score critiques'  VALUE TO_CHAR(j.ScoreAGregeJeu,  'FM90.9'),
           'nb votes critiques' VALUE TO_CHAR(j.NombreScoresAgregeesJeu)
         ) 
         RETURNING CLOB
    INTO l_json
    FROM JEU j
   WHERE j.IdJeu = p_id_jeu;

  RETURN l_json;
END FICHE_DETAILLEE;
/


SELECT COUNT(*) AS nb_jeux
FROM JEU;

select * from jeu;

TRUNCATE TABLE JEU;

PURGE RECYCLEBIN;

SELECT bytes/(1024*1024) AS utilisé, max_bytes/(1024*1024) AS maximum
FROM dba_ts_quotas
WHERE username = USER;

BEGIN
  FOR prfn IN (SELECT object_name FROM user_objects 
              WHERE object_type IN ('PROCEDURE', 'FUNCTION')) LOOP
    EXECUTE IMMEDIATE 'GRANT ALL ON ' || prfn.object_name || ' TO GestionJV';
  END LOOP;
END;
/

BEGIN
  FOR vue IN (SELECT view_name FROM user_views) LOOP
    EXECUTE IMMEDIATE 'GRANT SELECT ON ' || vue.view_name || ' TO AnalyseJV';
  END LOOP;
END;
/

GRANT EXECUTE ON FUNCTION TO AnalyseJV;

CREATE PROCEDURE AJOUTER_DATE_SORTIE(
    p_idJeu IN JEU.IdJeu%TYPE,
    p_idPlateforme IN PLATEFORME.IdPlateforme%TYPE,
    p_dateSortie IN DATE,
    p_regionSortie IN VARCHAR2,
    p_statut IN VARCHAR2
)
IS
    v_countJeu NUMBER;
    v_countPlateforme NUMBER;
    v_countSortie NUMBER;
    
    TYPE t_regions IS TABLE OF VARCHAR2(20);
    v_regions t_regions := t_regions(
        'north_america', 'europe', 'japan', 'worldwide', 
        'australia', 'brazil', 'new_zealand', 'asia', 
        'china', 'korea'
    );
    
    v_region_valide BOOLEAN := FALSE;
BEGIN
    SELECT COUNT(*) INTO v_countJeu
    FROM JEU
    WHERE IdJeu = p_idJeu;
    
    IF v_countJeu = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
    END IF;
    
    SELECT COUNT(*) INTO v_countPlateforme
    FROM PLATEFORME
    WHERE IdPlateforme = p_idPlateforme;
    
    IF v_countPlateforme = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Plateforme inexistante');
    END IF;
    
    FOR i IN 1..v_regions.COUNT LOOP
        IF LOWER(p_regionSortie) = v_regions(i) THEN
            v_region_valide := TRUE;
            EXIT;
        END IF;
    END LOOP;
    
    IF NOT v_region_valide THEN
        RAISE_APPLICATION_ERROR(-20003, 'Région inconnue');
    END IF;
    
    SELECT COUNT(*) INTO v_countSortie
    FROM DATESORTIE
    WHERE IdJeu = p_idJeu
    AND IdPlateforme = p_idPlateforme
    AND RegionSortie = p_regionSortie;
    
    IF v_countSortie > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Sortie déjà enregistrée');
    END IF;
    
    INSERT INTO DATESORTIE (IdDateSortie, IdJeu, IdPlateforme, DateSortie, RegionSortie, StatutSortie)
    VALUES (
        (SELECT NVL(MAX(IdDateSortie), 0) + 1 FROM DATESORTIE),
        p_idJeu,
        p_idPlateforme,
        p_dateSortie,
        p_regionSortie,
        p_statut
    );
    
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END AJOUTER_DATE_SORTIE;
/
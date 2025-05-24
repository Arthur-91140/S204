create or replace FUNCTION FICHE_DETAILLEE(p_id_jeu IN JEU.IdJeu%TYPE) RETURN CLOB
IS
    v_json CLOB;
    v_count NUMBER;
BEGIN
    -- Vérifier si le jeu existe
    SELECT COUNT(*)
    INTO v_count
    FROM JEU
    WHERE IdJeu = p_id_jeu;
    
    -- Lever l'exception si le jeu n'existe pas
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
    END IF;
    
    SELECT JSON_OBJECT(
        'titre' VALUE J.TitreJeu,
        'résumé' VALUE J.ResumeJeu,
        'mode(s) de jeu' VALUE COALESCE(
            (SELECT JSON_ARRAYAGG(M.NomModalite RETURNING CLOB)
             FROM MODALITE M
             JOIN MODALITEJEU MJ ON MJ.idModalite = M.idModalite
             WHERE MJ.IdJeu = p_id_jeu),
            TO_CLOB('[]')
        ) FORMAT JSON,
        'développeur(s)' VALUE COALESCE(
            (SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE C.IdCompagnie,
                    'nom' VALUE C.NomCompagnie
                ) ORDER BY C.IdCompagnie DESC
                RETURNING CLOB
            )
            FROM COMPAGNIE C
            JOIN COMPAGNIEJEU CJ ON C.IdCompagnie = CJ.idCompagnie
            WHERE CJ.IdJeu = p_id_jeu AND CJ.EstDeveloppeur = 1),
            TO_CLOB('[]')
        ) FORMAT JSON,
        'publieur(s)' VALUE COALESCE(
            (SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE C.IdCompagnie,
                    'nom' VALUE C.NomCompagnie
                ) ORDER BY C.IdCompagnie
                RETURNING CLOB
            )
            FROM COMPAGNIE C
            JOIN COMPAGNIEJEU CJ ON C.IdCompagnie = CJ.idCompagnie
            WHERE CJ.IdJeu = p_id_jeu AND CJ.EstPublieur = 1),
            TO_CLOB('[]')
        ) FORMAT JSON,
        'plateforme(s)' VALUE COALESCE(
            (SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'nom' VALUE P.NomPlateforme,
                    'date sortie' VALUE DS.DateSortie,
                    'statut' VALUE NVL(DS.StatutSortie, 'Full release')
                ) ORDER BY P.NomPlateforme, DS.DateSortie
                RETURNING CLOB
            )
            FROM PLATEFORME P
            JOIN DATESORTIE DS ON DS.idPlateforme = P.idPlateforme
            WHERE DS.IdJeu = p_id_jeu),
            TO_CLOB('[]')
        ) FORMAT JSON,
        'score' VALUE J.ScoreJeu,
        'nb votes' VALUE J.NombreNotesJeu,
        'score critiques' VALUE J.ScoreAgregeJeu,
        'nb votes critiques' VALUE J.NombreNotesAgregeesJeu
        RETURNING CLOB
    ) INTO v_json
    FROM JEU J
    WHERE J.IdJeu = p_id_jeu;
    
    RETURN v_json;
END;
/
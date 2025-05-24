create or replace FUNCTION MEILLEURS_JEUX(id_plateforme IN NUMBER) 
RETURN CLOB IS
    v_result CLOB;
    v_plateforme_exists NUMBER;
BEGIN
    -- Vérifier si la plateforme existe
    SELECT COUNT(*) INTO v_plateforme_exists FROM PLATEFORME P WHERE P.IDPLATEFORME = id_plateforme;
    IF v_plateforme_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Plateforme inexistante');
    END IF;
    
    -- Initialiser l'objet JSON
    v_result := '{' || CHR(10) || '"jeux":[' || CHR(10);
    
    -- Récupérer les 100 meilleurs jeux selon le popscore
    DECLARE
        CURSOR c_jeux IS
            SELECT * FROM (
                SELECT 
                    j.IDJEU,
                    j.TITREJEU,
                    (NVL(0.5 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Visits' THEN p.VALEURPOPULARITE END), 0) + 
                     NVL(0.25 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Played' THEN p.VALEURPOPULARITE END), 0) + 
                     NVL(0.15 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Playing' THEN p.VALEURPOPULARITE END), 0) + 
                     NVL(0.1 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Want to Play' THEN p.VALEURPOPULARITE END), 0)) AS popscore,
                    RANK() OVER (ORDER BY 
                        (NVL(0.5 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Visits' THEN p.VALEURPOPULARITE END), 0) + 
                         NVL(0.25 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Played' THEN p.VALEURPOPULARITE END), 0) + 
                         NVL(0.15 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Playing' THEN p.VALEURPOPULARITE END), 0) + 
                         NVL(0.1 * MAX(CASE WHEN p.MESUREPOPULARITE = 'Want to Play' THEN p.VALEURPOPULARITE END), 0)) DESC) AS rang
                FROM JEU j
                JOIN (SELECT DISTINCT IDJEU FROM DATESORTIE WHERE IDPLATEFORME = id_plateforme) ds ON j.IDJEU = ds.IDJEU
                LEFT JOIN POPULARITE p ON j.IDJEU = p.IDJEU 
                WHERE (SELECT COUNT(*) FROM POPULARITE p_check 
                       WHERE p_check.IDJEU = j.IDJEU 
                       AND p_check.MESUREPOPULARITE IN ('Visits', 'Played', 'Playing', 'Want to Play')
                       AND p_check.VALEURPOPULARITE > 0) > 0
                GROUP BY j.IDJEU, j.TITREJEU
                ORDER BY popscore DESC, j.TITREJEU
            ) WHERE rang <= 100;
            
        v_first BOOLEAN := TRUE;
    BEGIN
        FOR jeu_rec IN c_jeux LOOP
            IF NOT v_first THEN
                v_result := v_result || ',' || CHR(10);
            ELSE
                v_first := FALSE;
            END IF;
            
            v_result := v_result || 
                        '    {' || CHR(10) ||
                        '        "id":' || jeu_rec.IDJEU || ',' || CHR(10) ||
                        '        "titre":"' || REPLACE(jeu_rec.TITREJEU, '"', '\"') || '",' || CHR(10) ||
                        '        "popscore":' || RTRIM(TRIM(REPLACE(TO_CHAR(jeu_rec.popscore, '0.00000000000000000000'), ',', '.')), '0') || ',' || CHR(10) ||
                        '        "rang":' || jeu_rec.rang || CHR(10) ||
                        '    }';
        END LOOP;
    END;
    
    -- Finaliser le JSON
    v_result := v_result || CHR(10) || ']' || CHR(10) || '}';
    
    RETURN v_result;
END MEILLEURS_JEUX;
/
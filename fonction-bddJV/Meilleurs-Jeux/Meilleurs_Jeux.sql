create or replace FUNCTION MEILLEURS_JEUX(numPlateforme IN NUMBER) 
RETURN CLOB IS
sortie CLOB;
existe_plateforme NUMBER;
BEGIN
    -- check si plateforme ok
    SELECT COUNT(*) INTO existe_plateforme 
    FROM PLATEFORME P 
    WHERE P.IDPLATEFORME = numPlateforme;
    
    IF existe_plateforme = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Plateforme inexistante');
    END IF;
    
    -- debut du json chr 10 pour les sauts de ligne
    sortie := '{' || CHR(10) || '"jeux":[' || CHR(10);
    
    -- top 100 des jeux
    DECLARE
        CURSOR cur_top_jeux IS
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
                JOIN (SELECT DISTINCT IDJEU FROM DATESORTIE WHERE IDPLATEFORME = numPlateforme) ds ON j.IDJEU = ds.IDJEU
                LEFT JOIN POPULARITE p ON j.IDJEU = p.IDJEU 
                WHERE (SELECT COUNT(*) FROM POPULARITE p_check 
                       WHERE p_check.IDJEU = j.IDJEU 
                       AND p_check.MESUREPOPULARITE IN ('Visits', 'Played', 'Playing', 'Want to Play')
                       AND p_check.VALEURPOPULARITE > 0) > 0
                GROUP BY j.IDJEU, j.TITREJEU
                ORDER BY popscore DESC, j.TITREJEU
            ) WHERE rang <= 100;
            
        premier BOOLEAN := TRUE;
    BEGIN
        FOR ligne_jeu IN cur_top_jeux LOOP
            -- virgule entre les elements
            IF NOT premier THEN
                sortie := sortie || ',' || CHR(10);
            ELSE
                premier := FALSE;
            END IF;
            
            sortie := sortie || 
                    '    {' || CHR(10) ||
                    '        "id":' || ligne_jeu.IDJEU || ',' || CHR(10) ||
                    '        "titre":"' || REPLACE(ligne_jeu.TITREJEU, '"', '\"') || '",' || CHR(10) ||
                    '        "popscore":' || RTRIM(TRIM(REPLACE(TO_CHAR(ligne_jeu.popscore, '0.00000000000000000000'), ',', '.')), '0') || ',' || CHR(10) ||
                    '        "rang":' || ligne_jeu.rang || CHR(10) ||
                    '    }';
        END LOOP;
    END;
    
    -- fin du json
    sortie := sortie || CHR(10) || ']' || CHR(10) || '}';
    
    RETURN sortie;
END MEILLEURS_JEUX;
/
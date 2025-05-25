create or replace FUNCTION FICHE_DETAILLEE(in_idJeu IN JEU.IdJeu%TYPE) 
RETURN CLOB
IS
    v_resultat CLOB;
    v_nb NUMBER;
BEGIN
    -- verifier si le jeu existe
    SELECT COUNT(*) INTO v_nb FROM JEU WHERE IdJeu = in_idJeu;
    
    IF v_nb = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Jeu inexistant');
    END IF;
    
    -- recuperer toutes les infos du jeu
    SELECT JSON_OBJECT(
        'titre' VALUE J.TitreJeu,
        'résumé' VALUE J.ResumeJeu,
        'mode(s) de jeu' VALUE COALESCE(
            (SELECT JSON_ARRAYAGG(M.NomModalite RETURNING CLOB)
             FROM MODALITE M
             JOIN MODALITEJEU MJ ON MJ.idModalite = M.idModalite
             WHERE MJ.IdJeu = in_idJeu),
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
            WHERE CJ.IdJeu = in_idJeu AND CJ.EstDeveloppeur = 1),
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
            WHERE CJ.IdJeu = in_idJeu AND CJ.EstPublieur = 1),
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
            WHERE DS.IdJeu = in_idJeu),
            TO_CLOB('[]')
        ) FORMAT JSON,
        'score' VALUE J.ScoreJeu,
        'nb votes' VALUE J.NombreNotesJeu,
        'score critiques' VALUE J.ScoreAgregeJeu,
        'nb votes critiques' VALUE J.NombreNotesAgregeesJeu
        RETURNING CLOB
    ) INTO v_resultat
    FROM JEU J
    WHERE J.IdJeu = in_idJeu;
    
    RETURN v_resultat;
END;
/
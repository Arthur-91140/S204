CREATE OR REPLACE VIEW FICHE_JEU AS
SELECT 
    j.IdJeu AS identifiant,
    j.TitreJeu AS titre,
    MIN(ds.DateSortie) AS premiere_date_sortie,
    COALESCE(j.StatutJeu, 'Publié') AS statut,
    LISTAGG(DISTINCT CASE WHEN cj.EstDeveloppeur = 1 THEN c.NomCompagnie END, ', ') 
        WITHIN GROUP (ORDER BY c.NomCompagnie) AS developpeurs,
    LISTAGG(DISTINCT g.NomGenre, ', ') 
        WITHIN GROUP (ORDER BY g.NomGenre) AS genres,
    LISTAGG(DISTINCT p.NomPlateforme, ', ') 
        WITHIN GROUP (ORDER BY p.NomPlateforme) AS plateformes,
    ROUND(CAST(j.ScoreIGDB AS NUMERIC(10,4)) / 10, 2) AS score_utilisateur,
    ROUND(CAST(j.Scoreagregejeu AS NUMERIC(10,4)) / 10, 2) AS score_critique
FROM JEU j
LEFT JOIN DATESORTIE ds ON j.IdJeu = ds.IdJeu
LEFT JOIN COMPAGNIEJEU cj ON j.IdJeu = cj.IdJeu
LEFT JOIN COMPAGNIE c ON cj.IdCompagnie = c.IdCompagnie
LEFT JOIN GENREJEU gj ON j.IdJeu = gj.IdJeu
LEFT JOIN GENRE g ON gj.IdGenre = g.IdGenre
LEFT JOIN PLATEFORME p ON ds.IdPlateforme = p.IdPlateforme
GROUP BY j.IdJeu, j.TitreJeu, j.StatutJeu, j.ScoreIGDB, j.ScoreagregeJeu;
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
CREATE OR REPLACE VIEW FICHE_JEU AS
SELECT 
        j.IDJEU AS identifiant,
        j.TITREJEU AS titre,
        -- premiere sortie du jeu
        MIN(ds.DATESORTIE) AS premiere_date_sortie,
        COALESCE(j.STATUTJEU, 'Publié') AS statut,
        -- liste des devs
        LISTAGG(DISTINCT CASE WHEN cj.ESTDEVELOPPEUR = 1 THEN c.NOMCOMPAGNIE END, ', ') 
            WITHIN GROUP (ORDER BY c.NOMCOMPAGNIE) AS developpeurs,
        -- tous les genres
        LISTAGG(DISTINCT g.NOMGENRE, ', ') 
            WITHIN GROUP (ORDER BY g.NOMGENRE) AS genres,
        LISTAGG(DISTINCT p.NOMPLATEFORME, ', ') 
            WITHIN GROUP (ORDER BY p.NOMPLATEFORME) AS plateformes,
        -- scores sur 10
        ROUND(CAST(j.SCOREIGDB AS NUMBER) / 10, 2) AS score_utilisateur,
        ROUND(CAST(j.SCOREAGREGEJEU AS NUMBER) / 10, 2) AS score_critique
FROM JEU j
        LEFT JOIN DATESORTIE ds ON j.IDJEU = ds.IDJEU
        LEFT JOIN COMPAGNIEJEU cj ON j.IDJEU = cj.IDJEU AND cj.ESTDEVELOPPEUR = 1
        LEFT JOIN COMPAGNIE c ON cj.IDCOMPAGNIE = c.IDCOMPAGNIE
        LEFT JOIN GENREJEU gj ON j.IDJEU = gj.IDJEU
        LEFT JOIN GENRE g ON gj.IDGENRE = g.IDGENRE
        LEFT JOIN PLATEFORME p ON ds.IDPLATEFORME = p.IDPLATEFORME
-- regroupement par jeu
GROUP BY j.IDJEU, j.TITREJEU, j.STATUTJEU, j.SCOREIGDB, j.SCOREAGREGEJEU
ORDER BY j.IDJEU;
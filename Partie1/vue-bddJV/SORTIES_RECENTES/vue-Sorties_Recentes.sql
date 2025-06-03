SELECT J.idJeu, J.titreJeu, DS.datesortie, 
-- toutes les plateformes
LISTAGG(DISTINCT P.nomplateforme, ', ') WITHIN GROUP (ORDER BY P.nomplateforme) AS plateforme
FROM jeu J
INNER JOIN datesortie DS ON ds.idJeu = j.idJeu
INNER JOIN plateforme P ON P.idplateforme = DS.idplateforme
-- que les jeux deja sortis
WHERE DS.datesortie <= SYSDATE
GROUP BY J.idJeu, J.titreJeu, DS.datesortie
-- tri par date
ORDER BY DS.datesortie DESC, J.titrejeu ASC;
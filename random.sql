SELECT COUNT(CASE WHEN commentaire = 'OK' THEN 1 END) || '/' || COUNT(*) AS resultat
FROM note_auto_s204;

SELECT *
FROM NOTE_AUTO_S204;

drop view SORTIES_RECENTES;

CREATE OR REPLACE VIEW SORTIES_RECENTES AS
SELECT J.idJeu, J.titreJeu, DS.datesortie, LISTAGG(DISTINCT P.nomplateforme, ', ') WITHIN GROUP (ORDER BY P.nomplateforme) AS plateforme
FROM jeu J
    JOIN datesortie DS ON ds.idJeu = j.idJeu
    JOIN plateforme P ON P.idplateforme = DS.idplateforme
WHERE DS.datesortie <= SYSDATE
GROUP BY J.idJeu, J.titreJeu, DS.datesortie
ORDER BY DS.datesortie DESC, J.titrejeu ASC;

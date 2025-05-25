--Obtenir la note totale de l'auto-évaluation S204 sur 20 points
SELECT TO_CHAR(SUM(note)) || '/10' AS note
FROM NOTE_AUTO_S204;

--Obtenir la note et les commentaires de l'auto-évaluation S204
SELECT *
FROM NOTE_AUTO_S204;

--Obtenir le nombre de commentaires "OK"
SELECT COUNT(CASE WHEN commentaire = 'OK' THEN 1 END) || '/' || COUNT(*) AS resultat
FROM note_auto_s204;

--Obtenir le nombre de "OK" et le transformer en note sur 20
SELECT ROUND(CAST(COUNT(CASE WHEN commentaire = 'OK' THEN 1 END) AS NUMERIC) / COUNT(*) * 20, 2) AS note_sur_20
FROM note_auto_s204;

--Obtenir le nombre de commentaire à corriger
SELECT *
FROM note_auto_s204
WHERE commentaire != 'OK';
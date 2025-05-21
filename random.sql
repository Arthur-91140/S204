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


-- Trigger INSERT pour CATEGORIEJEU
CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCategorieJeu, NULL, NULL, :NEW.IdCategorieJeu || ' | ' || :NEW.NomCategorieJeu, 'CATEGORIEJEU');
END;
/

-- Trigger DELETE pour CATEGORIEJEU
CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, :OLD.IdCategorieJeu || ' | ' || :OLD.NomCategorieJeu, NULL, 'CATEGORIEJEU');
END;
/

-- Trigger UPDATE pour CATEGORIEJEU
CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, :OLD.IdCategorieJeu || ' | ' || :OLD.NomCategorieJeu, :NEW.IdCategorieJeu || ' | ' || :NEW.NomCategorieJeu, 'CATEGORIEJEU');
END;
/


-- Trigger INSERT pour CLASSIFICATIONJEU
CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_INSERT
AFTER INSERT ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdClassification, NULL, NULL, :NEW.IdClassification || ' | ' || :NEW.IdJeu, 'CLASSIFICATIONJEU');
END;
/

-- Trigger DELETE pour CLASSIFICATIONJEU
CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_DELETE
AFTER DELETE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdClassification, NULL, :OLD.IdClassification || ' | ' || :OLD.IdJeu, NULL, 'CLASSIFICATIONJEU');
END;
/

-- Trigger UPDATE pour CLASSIFICATIONJEU
CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_UPDATE
AFTER UPDATE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdClassification, NULL, :OLD.IdClassification || ' | ' || :OLD.IdJeu, :NEW.IdClassification || ' | ' || :NEW.IdJeu, 'CLASSIFICATIONJEU');
END;
/

-- Trigger INSERT pour COMPAGNIEJEU
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_INSERT
AFTER INSERT ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, 
         :NEW.IdJeu || ' | ' || :NEW.IdCompagnie || ' | ' || 
         :NEW.EstDeveloppeur || ' | ' || :NEW.EstPorteur || ' | ' || 
         :NEW.EstPublieur || ' | ' || :NEW.EstSoutien, 'COMPAGNIEJEU');
END;
/

-- Trigger DELETE pour COMPAGNIEJEU
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_DELETE
AFTER DELETE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdCompagnie || ' | ' || 
         :OLD.EstDeveloppeur || ' | ' || :OLD.EstPorteur || ' | ' || 
         :OLD.EstPublieur || ' | ' || :OLD.EstSoutien, NULL, 'COMPAGNIEJEU');
END;
/

-- Trigger UPDATE pour COMPAGNIEJEU
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_UPDATE
AFTER UPDATE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdCompagnie || ' | ' || 
         :OLD.EstDeveloppeur || ' | ' || :OLD.EstPorteur || ' | ' || 
         :OLD.EstPublieur || ' | ' || :OLD.EstSoutien,
         :NEW.IdJeu || ' | ' || :NEW.IdCompagnie || ' | ' || 
         :NEW.EstDeveloppeur || ' | ' || :NEW.EstPorteur || ' | ' || 
         :NEW.EstPublieur || ' | ' || :NEW.EstSoutien, 'COMPAGNIEJEU');
END;
/

-- Trigger INSERT pour COMPAGNIEMOTEUR
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_INSERT
AFTER INSERT ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, 
         :NEW.IdCompagnie || ' | ' || :NEW.IdMoteur, 'COMPAGNIEMOTEUR');
END;
/

-- Trigger DELETE pour COMPAGNIEMOTEUR
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_DELETE
AFTER DELETE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, 
         :OLD.IdCompagnie || ' | ' || :OLD.IdMoteur, NULL, 'COMPAGNIEMOTEUR');
END;
/

-- Trigger UPDATE pour COMPAGNIEMOTEUR
CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_UPDATE
AFTER UPDATE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, 
         :OLD.IdCompagnie || ' | ' || :OLD.IdMoteur,
         :NEW.IdCompagnie || ' | ' || :NEW.IdMoteur, 'COMPAGNIEMOTEUR');
END;
/

-- Trigger INSERT pour FRANCHISEJEU
CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_INSERT
AFTER INSERT ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, 
         :NEW.IdJeu || ' | ' || :NEW.IdFranchise, 'FRANCHISEJEU');
END;
/

-- Trigger DELETE pour FRANCHISEJEU
CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_DELETE
AFTER DELETE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdFranchise, NULL, 'FRANCHISEJEU');
END;
/

-- Trigger UPDATE pour FRANCHISEJEU
CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_UPDATE
AFTER UPDATE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdFranchise,
         :NEW.IdJeu || ' | ' || :NEW.IdFranchise, 'FRANCHISEJEU');
END;
/


-- Trigger INSERT pour GENREJEU
CREATE OR REPLACE TRIGGER declencheur_GENREJEU_INSERT
AFTER INSERT ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, 
         :NEW.IdJeu || ' | ' || :NEW.IdGenre, 'GENREJEU');
END;
/

-- Trigger DELETE pour GENREJEU
CREATE OR REPLACE TRIGGER declencheur_GENREJEU_DELETE
AFTER DELETE ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdGenre, NULL, 'GENREJEU');
END;
/

-- Trigger UPDATE pour GENREJEU
CREATE OR REPLACE TRIGGER declencheur_GENREJEU_UPDATE
AFTER UPDATE ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, 
         :OLD.IdJeu || ' | ' || :OLD.IdGenre,
         :NEW.IdJeu || ' | ' || :NEW.IdGenre, 'GENREJEU');
END;
/











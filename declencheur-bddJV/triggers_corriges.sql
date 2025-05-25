-- Triggers générés automatiquement pour la BDD jeux vidéo
-- Table LOG pour enregistrer les modifications

-- Création de la table LOG si elle n'existe pas
CREATE TABLE LOG (
    idLog NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idAuteur VARCHAR2(128) NOT NULL,
    action VARCHAR2(20) NOT NULL,
    dateHeureAction TIMESTAMP NOT NULL,
    ligneAvant VARCHAR2(4000),
    ligneApres VARCHAR2(4000)
);

-- Pour vider la table LOG: DELETE FROM LOG; ou TRUNCATE TABLE LOG;

-- Triggers pour la table CATEGORIEJEU
CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdCategorieJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCategoriejeu), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdCategorieJeu, 'NULL_VALUE') != NVL(:NEW.IdCategorieJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomCategoriejeu, 'NULL_VALUE') != NVL(:NEW.NomCategoriejeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdCategorieJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCategoriejeu), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdCategorieJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCategoriejeu), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdCategorieJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCategoriejeu), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table CATEGORIEPLATEFORME
CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_INSERT
AFTER INSERT ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdCategoriePlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCategoriePlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_UPDATE
AFTER UPDATE ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdCategoriePlateforme, 'NULL_VALUE') != NVL(:NEW.IdCategoriePlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomCategoriePlateforme, 'NULL_VALUE') != NVL(:NEW.NomCategoriePlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdCategoriePlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCategoriePlateforme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdCategoriePlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCategoriePlateforme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_DELETE
AFTER DELETE ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdCategoriePlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCategoriePlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table CLASSIFICATIONAGE
CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_INSERT
AFTER INSERT ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.OrganismeClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.Classification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.SynopsisClassification), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_UPDATE
AFTER UPDATE ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdClassification, 'NULL_VALUE') != NVL(:NEW.IdClassification, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.OrganismeClassification, 'NULL_VALUE') != NVL(:NEW.OrganismeClassification, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.Classification, 'NULL_VALUE') != NVL(:NEW.Classification, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.SynopsisClassification, 'NULL_VALUE') != NVL(:NEW.SynopsisClassification, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.OrganismeClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.Classification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.SynopsisClassification), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.OrganismeClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.Classification), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.SynopsisClassification), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_DELETE
AFTER DELETE ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.OrganismeClassification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.Classification), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.SynopsisClassification), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table COMPAGNIE
CREATE OR REPLACE TRIGGER trig_COMPAGNIE_INSERT
AFTER INSERT ON COMPAGNIE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescrCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.PaysCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateFondationCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.CompagnieParent), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_UPDATE
AFTER UPDATE ON COMPAGNIE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdCompagnie, 'NULL_VALUE') != NVL(:NEW.IdCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomCompagnie, 'NULL_VALUE') != NVL(:NEW.NomCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DescrCompagnie, 'NULL_VALUE') != NVL(:NEW.DescrCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.PaysCompagnie, 'NULL_VALUE') != NVL(:NEW.PaysCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateFondationCompagnie, 'NULL_VALUE') != NVL(:NEW.DateFondationCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateMAJCompagnie, 'NULL_VALUE') != NVL(:NEW.DateMAJCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.CompagnieParent, 'NULL_VALUE') != NVL(:NEW.CompagnieParent, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescrCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.PaysCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateFondationCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.CompagnieParent), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescrCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.PaysCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateFondationCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.CompagnieParent), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_DELETE
AFTER DELETE ON COMPAGNIE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescrCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.PaysCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateFondationCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.CompagnieParent), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table DATESORTIE
CREATE OR REPLACE TRIGGER trig_DATESORTIE_INSERT
AFTER INSERT ON DATESORTIE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdDateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.RegionSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.StatutSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJDateSortie), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_UPDATE
AFTER UPDATE ON DATESORTIE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdDateSortie, 'NULL_VALUE') != NVL(:NEW.IdDateSortie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateSortie, 'NULL_VALUE') != NVL(:NEW.DateSortie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.RegionSortie, 'NULL_VALUE') != NVL(:NEW.RegionSortie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.StatutSortie, 'NULL_VALUE') != NVL(:NEW.StatutSortie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateMAJDateSortie, 'NULL_VALUE') != NVL(:NEW.DateMAJDateSortie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdDateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.RegionSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.StatutSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJDateSortie), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdDateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.RegionSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.StatutSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJDateSortie), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_DELETE
AFTER DELETE ON DATESORTIE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdDateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.RegionSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.StatutSortie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJDateSortie), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table FRANCHISE
CREATE OR REPLACE TRIGGER trig_FRANCHISE_INSERT
AFTER INSERT ON FRANCHISE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdFranchise), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomFranchise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_UPDATE
AFTER UPDATE ON FRANCHISE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdFranchise, 'NULL_VALUE') != NVL(:NEW.IdFranchise, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomFranchise, 'NULL_VALUE') != NVL(:NEW.NomFranchise, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdFranchise), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomFranchise), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdFranchise), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomFranchise), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_DELETE
AFTER DELETE ON FRANCHISE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdFranchise), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomFranchise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table JEU
CREATE OR REPLACE TRIGGER trig_JEU_INSERT
AFTER INSERT ON JEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreVersionJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.HistoireJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ResumeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreAgregeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesAgregeesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreIGDB), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesIGDBJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Normal), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Rapide), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Complet), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreTempsJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.StatutJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.VersionParent), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeuParent), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.FranchisePrincipaleJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.CategorieJeu), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_UPDATE
AFTER UPDATE ON JEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TitreJeu, 'NULL_VALUE') != NVL(:NEW.TitreJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TitreVersionJeu, 'NULL_VALUE') != NVL(:NEW.TitreVersionJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.HistoireJeu, 'NULL_VALUE') != NVL(:NEW.HistoireJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ResumeJeu, 'NULL_VALUE') != NVL(:NEW.ResumeJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ScoreAgregeJeu, 'NULL_VALUE') != NVL(:NEW.ScoreAgregeJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NombreNotesAgregeesJeu, 'NULL_VALUE') != NVL(:NEW.NombreNotesAgregeesJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ScoreIGDB, 'NULL_VALUE') != NVL(:NEW.ScoreIGDB, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NombreNotesIGDBJeu, 'NULL_VALUE') != NVL(:NEW.NombreNotesIGDBJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ScoreJeu, 'NULL_VALUE') != NVL(:NEW.ScoreJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NombreNotesJeu, 'NULL_VALUE') != NVL(:NEW.NombreNotesJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TempsJeu_Normal, 'NULL_VALUE') != NVL(:NEW.TempsJeu_Normal, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TempsJeu_Rapide, 'NULL_VALUE') != NVL(:NEW.TempsJeu_Rapide, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TempsJeu_Complet, 'NULL_VALUE') != NVL(:NEW.TempsJeu_Complet, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NombreTempsJeu, 'NULL_VALUE') != NVL(:NEW.NombreTempsJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.StatutJeu, 'NULL_VALUE') != NVL(:NEW.StatutJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateMAJJeu, 'NULL_VALUE') != NVL(:NEW.DateMAJJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.VersionParent, 'NULL_VALUE') != NVL(:NEW.VersionParent, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdJeuParent, 'NULL_VALUE') != NVL(:NEW.IdJeuParent, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.FranchisePrincipaleJeu, 'NULL_VALUE') != NVL(:NEW.FranchisePrincipaleJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.CategorieJeu, 'NULL_VALUE') != NVL(:NEW.CategorieJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreVersionJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.HistoireJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ResumeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreAgregeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesAgregeesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreIGDB), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesIGDBJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Normal), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Rapide), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Complet), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreTempsJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.StatutJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.VersionParent), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeuParent), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.FranchisePrincipaleJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.CategorieJeu), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreVersionJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.HistoireJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ResumeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreAgregeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesAgregeesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreIGDB), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesIGDBJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ScoreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreNotesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Normal), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Rapide), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TempsJeu_Complet), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NombreTempsJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.StatutJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.VersionParent), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeuParent), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.FranchisePrincipaleJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.CategorieJeu), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_DELETE
AFTER DELETE ON JEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreVersionJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.HistoireJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ResumeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreAgregeJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesAgregeesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreIGDB), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesIGDBJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ScoreJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreNotesJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Normal), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Rapide), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TempsJeu_Complet), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NombreTempsJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.StatutJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.VersionParent), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeuParent), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.FranchisePrincipaleJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.CategorieJeu), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table GENRE
CREATE OR REPLACE TRIGGER trig_GENRE_INSERT
AFTER INSERT ON GENRE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdGenre), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomGenre), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_UPDATE
AFTER UPDATE ON GENRE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdGenre, 'NULL_VALUE') != NVL(:NEW.IdGenre, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomGenre, 'NULL_VALUE') != NVL(:NEW.NomGenre, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdGenre), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomGenre), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdGenre), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomGenre), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_DELETE
AFTER DELETE ON GENRE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdGenre), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomGenre), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MODALITE
CREATE OR REPLACE TRIGGER trig_MODALITE_INSERT
AFTER INSERT ON MODALITE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdModalite), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomModalite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_UPDATE
AFTER UPDATE ON MODALITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdModalite, 'NULL_VALUE') != NVL(:NEW.IdModalite, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomModalite, 'NULL_VALUE') != NVL(:NEW.NomModalite, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdModalite), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomModalite), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdModalite), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomModalite), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_DELETE
AFTER DELETE ON MODALITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdModalite), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomModalite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MODEMULTIJOUEUR
CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_INSERT
AFTER INSERT ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdModeMultiJoueur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DropIn), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopCampagne), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopLAN), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeSplitScreen), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_UPDATE
AFTER UPDATE ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdModeMultiJoueur, 'NULL_VALUE') != NVL(:NEW.IdModeMultiJoueur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DropIn, 'NULL_VALUE') != NVL(:NEW.DropIn, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ModeCoopCampagne, 'NULL_VALUE') != NVL(:NEW.ModeCoopCampagne, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ModeCoopLAN, 'NULL_VALUE') != NVL(:NEW.ModeCoopLAN, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ModeCoopOffline, 'NULL_VALUE') != NVL(:NEW.ModeCoopOffline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ModeCoopOnline, 'NULL_VALUE') != NVL(:NEW.ModeCoopOnline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ModeSplitScreen, 'NULL_VALUE') != NVL(:NEW.ModeSplitScreen, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NbJoueursMaxCoopOffline, 'NULL_VALUE') != NVL(:NEW.NbJoueursMaxCoopOffline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NbJoueursMaxOffline, 'NULL_VALUE') != NVL(:NEW.NbJoueursMaxOffline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NbJoueursMaxCoopOnline, 'NULL_VALUE') != NVL(:NEW.NbJoueursMaxCoopOnline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NbJoueursMaxOnline, 'NULL_VALUE') != NVL(:NEW.NbJoueursMaxOnline, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdPlateforme, 'NULL_VALUE') != NVL(:NEW.IdPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdModeMultiJoueur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DropIn), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopCampagne), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopLAN), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeSplitScreen), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdModeMultiJoueur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DropIn), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopCampagne), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopLAN), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ModeSplitScreen), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NbJoueursMaxOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_DELETE
AFTER DELETE ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdModeMultiJoueur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DropIn), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopCampagne), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopLAN), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ModeSplitScreen), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxCoopOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxOffline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxCoopOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NbJoueursMaxOnline), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MOTCLE
CREATE OR REPLACE TRIGGER trig_MOTCLE_INSERT
AFTER INSERT ON MOTCLE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdMotCle), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomMotCle), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_UPDATE
AFTER UPDATE ON MOTCLE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdMotCle, 'NULL_VALUE') != NVL(:NEW.IdMotCle, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomMotCle, 'NULL_VALUE') != NVL(:NEW.NomMotCle, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdMotCle), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomMotCle), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdMotCle), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomMotCle), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_DELETE
AFTER DELETE ON MOTCLE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdMotCle), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomMotCle), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MOTEUR
CREATE OR REPLACE TRIGGER trig_MOTEUR_INSERT
AFTER INSERT ON MOTEUR
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescrMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_UPDATE
AFTER UPDATE ON MOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdMoteur, 'NULL_VALUE') != NVL(:NEW.IdMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomMoteur, 'NULL_VALUE') != NVL(:NEW.NomMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DescrMoteur, 'NULL_VALUE') != NVL(:NEW.DescrMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DateMAJMoteur, 'NULL_VALUE') != NVL(:NEW.DateMAJMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescrMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJMoteur), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescrMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DateMAJMoteur), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_DELETE
AFTER DELETE ON MOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescrMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DateMAJMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table PLATEFORME
CREATE OR REPLACE TRIGGER trig_PLATEFORME_INSERT
AFTER INSERT ON PLATEFORME
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.AbbreviationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomAlternatifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescriptifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.GenerationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdCategoriePlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_UPDATE
AFTER UPDATE ON PLATEFORME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdPlateforme, 'NULL_VALUE') != NVL(:NEW.IdPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomPlateforme, 'NULL_VALUE') != NVL(:NEW.NomPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.AbbreviationPlateforme, 'NULL_VALUE') != NVL(:NEW.AbbreviationPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomAlternatifPlateforme, 'NULL_VALUE') != NVL(:NEW.NomAlternatifPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.DescriptifPlateforme, 'NULL_VALUE') != NVL(:NEW.DescriptifPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.GenerationPlateforme, 'NULL_VALUE') != NVL(:NEW.GenerationPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdCategoriePlateforme, 'NULL_VALUE') != NVL(:NEW.IdCategoriePlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.AbbreviationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomAlternatifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescriptifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.GenerationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdCategoriePlateforme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.AbbreviationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomAlternatifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.DescriptifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.GenerationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdCategoriePlateforme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_DELETE
AFTER DELETE ON PLATEFORME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.AbbreviationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomAlternatifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.DescriptifPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.GenerationPlateforme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdCategoriePlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table POPULARITE
CREATE OR REPLACE TRIGGER trig_POPULARITE_INSERT
AFTER INSERT ON POPULARITE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.MesurePopularite), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ValeurPopularite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_UPDATE
AFTER UPDATE ON POPULARITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.MesurePopularite, 'NULL_VALUE') != NVL(:NEW.MesurePopularite, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.ValeurPopularite, 'NULL_VALUE') != NVL(:NEW.ValeurPopularite, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.MesurePopularite), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ValeurPopularite), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.MesurePopularite), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.ValeurPopularite), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_DELETE
AFTER DELETE ON POPULARITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.MesurePopularite), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.ValeurPopularite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table REGION
CREATE OR REPLACE TRIGGER trig_REGION_INSERT
AFTER INSERT ON REGION
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomRegion), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_UPDATE
AFTER UPDATE ON REGION
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdRegion, 'NULL_VALUE') != NVL(:NEW.IdRegion, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomRegion, 'NULL_VALUE') != NVL(:NEW.NomRegion, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomRegion), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomRegion), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_DELETE
AFTER DELETE ON REGION
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomRegion), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table THEME
CREATE OR REPLACE TRIGGER trig_THEME_INSERT
AFTER INSERT ON THEME
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdTheme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomTheme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_UPDATE
AFTER UPDATE ON THEME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdTheme, 'NULL_VALUE') != NVL(:NEW.IdTheme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.NomTheme, 'NULL_VALUE') != NVL(:NEW.NomTheme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdTheme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomTheme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdTheme), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.NomTheme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_DELETE
AFTER DELETE ON THEME
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdTheme), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.NomTheme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table TITREALTERNATIF
CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_INSERT
AFTER INSERT ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.LibelleTitreAlternatif), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_UPDATE
AFTER UPDATE ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdTitreAlternatif, 'NULL_VALUE') != NVL(:NEW.IdTitreAlternatif, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.LibelleTitreAlternatif, 'NULL_VALUE') != NVL(:NEW.LibelleTitreAlternatif, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.LibelleTitreAlternatif), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.LibelleTitreAlternatif), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_DELETE
AFTER DELETE ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.LibelleTitreAlternatif), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table COMPAGNIEJEU
CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_INSERT
AFTER INSERT ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstDeveloppeur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstPorteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstPublieur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstSoutien), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_UPDATE
AFTER UPDATE ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdCompagnie, 'NULL_VALUE') != NVL(:NEW.IdCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.EstDeveloppeur, 'NULL_VALUE') != NVL(:NEW.EstDeveloppeur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.EstPorteur, 'NULL_VALUE') != NVL(:NEW.EstPorteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.EstPublieur, 'NULL_VALUE') != NVL(:NEW.EstPublieur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.EstSoutien, 'NULL_VALUE') != NVL(:NEW.EstSoutien, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstDeveloppeur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstPorteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstPublieur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstSoutien), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstDeveloppeur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstPorteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstPublieur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.EstSoutien), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_DELETE
AFTER DELETE ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstDeveloppeur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstPorteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstPublieur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.EstSoutien), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MODALITEJEU
CREATE OR REPLACE TRIGGER trig_MODALITEJEU_INSERT
AFTER INSERT ON MODALITEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdModalite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_UPDATE
AFTER UPDATE ON MODALITEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdModalite, 'NULL_VALUE') != NVL(:NEW.IdModalite, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdModalite), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdModalite), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_DELETE
AFTER DELETE ON MODALITEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdModalite), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table GENREJEU
CREATE OR REPLACE TRIGGER trig_GENREJEU_INSERT
AFTER INSERT ON GENREJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdGenre), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_UPDATE
AFTER UPDATE ON GENREJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdGenre, 'NULL_VALUE') != NVL(:NEW.IdGenre, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdGenre), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdGenre), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_DELETE
AFTER DELETE ON GENREJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdGenre), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table TITREALTERNATIFJEU
CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_INSERT
AFTER INSERT ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.LibelleTitreAlternatif), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_UPDATE
AFTER UPDATE ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdTitreAlternatif, 'NULL_VALUE') != NVL(:NEW.IdTitreAlternatif, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.LibelleTitreAlternatif, 'NULL_VALUE') != NVL(:NEW.LibelleTitreAlternatif, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.LibelleTitreAlternatif), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.LibelleTitreAlternatif), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_DELETE
AFTER DELETE ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdTitreAlternatif), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.LibelleTitreAlternatif), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table SIMILARITE
CREATE OR REPLACE TRIGGER trig_SIMILARITE_INSERT
AFTER INSERT ON SIMILARITE
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeuSimilaire), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_UPDATE
AFTER UPDATE ON SIMILARITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdJeuSimilaire, 'NULL_VALUE') != NVL(:NEW.IdJeuSimilaire, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeuSimilaire), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdJeuSimilaire), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_DELETE
AFTER DELETE ON SIMILARITE
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdJeuSimilaire), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MOTCLEJEU
CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_INSERT
AFTER INSERT ON MOTCLEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMotCle), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_UPDATE
AFTER UPDATE ON MOTCLEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdMotCle, 'NULL_VALUE') != NVL(:NEW.IdMotCle, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMotCle), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMotCle), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_DELETE
AFTER DELETE ON MOTCLEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMotCle), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table THEMEJEU
CREATE OR REPLACE TRIGGER trig_THEMEJEU_INSERT
AFTER INSERT ON THEMEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdTheme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_UPDATE
AFTER UPDATE ON THEMEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdTheme, 'NULL_VALUE') != NVL(:NEW.IdTheme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdTheme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdTheme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_DELETE
AFTER DELETE ON THEMEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdTheme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table CLASSIFICATIONJEU
CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_INSERT
AFTER INSERT ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdClassification), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_UPDATE
AFTER UPDATE ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdClassification, 'NULL_VALUE') != NVL(:NEW.IdClassification, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdClassification), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdClassification), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_DELETE
AFTER DELETE ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdClassification), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table MOTEURJEU
CREATE OR REPLACE TRIGGER trig_MOTEURJEU_INSERT
AFTER INSERT ON MOTEURJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_UPDATE
AFTER UPDATE ON MOTEURJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdMoteur, 'NULL_VALUE') != NVL(:NEW.IdMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMoteur), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMoteur), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_DELETE
AFTER DELETE ON MOTEURJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table COMPAGNIEMOTEUR
CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_INSERT
AFTER INSERT ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_UPDATE
AFTER UPDATE ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdCompagnie, 'NULL_VALUE') != NVL(:NEW.IdCompagnie, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdMoteur, 'NULL_VALUE') != NVL(:NEW.IdMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMoteur), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdMoteur), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_DELETE
AFTER DELETE ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdCompagnie), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdMoteur), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table PLATEFORMEMOTEUR
CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_INSERT
AFTER INSERT ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_UPDATE
AFTER UPDATE ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdMoteur, 'NULL_VALUE') != NVL(:NEW.IdMoteur, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdPlateforme, 'NULL_VALUE') != NVL(:NEW.IdPlateforme, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdPlateforme), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_DELETE
AFTER DELETE ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdMoteur), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdPlateforme), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table FRANCHISEJEU
CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_INSERT
AFTER INSERT ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdFranchise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_UPDATE
AFTER UPDATE ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdFranchise, 'NULL_VALUE') != NVL(:NEW.IdFranchise, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdFranchise), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdFranchise), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_DELETE
AFTER DELETE ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdFranchise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/


-- Triggers pour la table LOCALISATIONJEU
CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_INSERT
AFTER INSERT ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    ligne_apres VARCHAR2(4000);
BEGIN
    ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreLocalise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, ligne_apres);
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_UPDATE
AFTER UPDATE ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
    ligne_apres VARCHAR2(4000);
    modifications_detectees BOOLEAN := FALSE;
BEGIN
    -- Vérifier les modifications colonne par colonne
    IF (NVL(:OLD.IdJeu, 'NULL_VALUE') != NVL(:NEW.IdJeu, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.IdRegion, 'NULL_VALUE') != NVL(:NEW.IdRegion, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    IF (NVL(:OLD.TitreLocalise, 'NULL_VALUE') != NVL(:NEW.TitreLocalise, 'NULL_VALUE')) THEN
        modifications_detectees := TRUE;
    END IF;
    
    -- Seulement logger s'il y a des modifications réelles
    IF modifications_detectees THEN
        ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreLocalise), 'NULL');
        ligne_apres := NVL(TO_CHAR(:NEW.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:NEW.TitreLocalise), 'NULL');
        
        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
        VALUES(USER, 'UPDATE', SYSTIMESTAMP, ligne_avant, ligne_apres);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_DELETE
AFTER DELETE ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    ligne_avant VARCHAR2(4000);
BEGIN
    ligne_avant := NVL(TO_CHAR(:OLD.IdJeu), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.IdRegion), 'NULL') || ' | ' || NVL(TO_CHAR(:OLD.TitreLocalise), 'NULL');
    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, ligne_avant, NULL);
END;
/



-- Triggers generes automatiquement pour la BDD jeux video
-- Pour vider la table LOG: DELETE FROM LOG; ou TRUNCATE TABLE LOG;

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdCategorieJeu || ' | ' || :NEW.NomCategoriejeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdCategorieJeu, NULL, NULL, val_apres, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCategorieJeu || ' | ' || :OLD.NomCategoriejeu;
    val_apres := :NEW.IdCategorieJeu || ' | ' || :NEW.NomCategoriejeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, val_avant, val_apres, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCategorieJeu || ' | ' || :OLD.NomCategoriejeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, val_avant, NULL, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_INSERT
AFTER INSERT ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdCategoriePlateforme || ' | ' || :NEW.NomCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdCategoriePlateforme, NULL, NULL, val_apres, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_UPDATE
AFTER UPDATE ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCategoriePlateforme || ' | ' || :OLD.NomCategoriePlateforme;
    val_apres := :NEW.IdCategoriePlateforme || ' | ' || :NEW.NomCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, val_avant, val_apres, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_DELETE
AFTER DELETE ON CATEGORIEPLATEFORME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCategoriePlateforme || ' | ' || :OLD.NomCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, val_avant, NULL, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_INSERT
AFTER INSERT ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdClassification || ' | ' || :NEW.OrganismeClassification || ' | ' || :NEW.Classification || ' | ' || :NEW.SynopsisClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdClassification, NULL, NULL, val_apres, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_UPDATE
AFTER UPDATE ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdClassification || ' | ' || :OLD.OrganismeClassification || ' | ' || :OLD.Classification || ' | ' || :OLD.SynopsisClassification;
    val_apres := :NEW.IdClassification || ' | ' || :NEW.OrganismeClassification || ' | ' || :NEW.Classification || ' | ' || :NEW.SynopsisClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdClassification, NULL, val_avant, val_apres, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_DELETE
AFTER DELETE ON CLASSIFICATIONAGE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdClassification || ' | ' || :OLD.OrganismeClassification || ' | ' || :OLD.Classification || ' | ' || :OLD.SynopsisClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdClassification, NULL, val_avant, NULL, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_INSERT
AFTER INSERT ON COMPAGNIE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdCompagnie || ' | ' || :NEW.NomCompagnie || ' | ' || :NEW.DescrCompagnie || ' | ' || :NEW.PaysCompagnie || ' | ' || :NEW.DateFondationCompagnie || ' | ' || :NEW.DateMAJCompagnie || ' | ' || :NEW.CompagnieParent;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, val_apres, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_UPDATE
AFTER UPDATE ON COMPAGNIE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCompagnie || ' | ' || :OLD.NomCompagnie || ' | ' || :OLD.DescrCompagnie || ' | ' || :OLD.PaysCompagnie || ' | ' || :OLD.DateFondationCompagnie || ' | ' || :OLD.DateMAJCompagnie || ' | ' || :OLD.CompagnieParent;
    val_apres := :NEW.IdCompagnie || ' | ' || :NEW.NomCompagnie || ' | ' || :NEW.DescrCompagnie || ' | ' || :NEW.PaysCompagnie || ' | ' || :NEW.DateFondationCompagnie || ' | ' || :NEW.DateMAJCompagnie || ' | ' || :NEW.CompagnieParent;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, val_avant, val_apres, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_DELETE
AFTER DELETE ON COMPAGNIE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCompagnie || ' | ' || :OLD.NomCompagnie || ' | ' || :OLD.DescrCompagnie || ' | ' || :OLD.PaysCompagnie || ' | ' || :OLD.DateFondationCompagnie || ' | ' || :OLD.DateMAJCompagnie || ' | ' || :OLD.CompagnieParent;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, val_avant, NULL, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_INSERT
AFTER INSERT ON DATESORTIE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdDateSortie || ' | ' || :NEW.DateSortie || ' | ' || :NEW.RegionSortie || ' | ' || :NEW.StatutSortie || ' | ' || :NEW.DateMAJDateSortie;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdDateSortie, NULL, NULL, val_apres, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_UPDATE
AFTER UPDATE ON DATESORTIE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdDateSortie || ' | ' || :OLD.DateSortie || ' | ' || :OLD.RegionSortie || ' | ' || :OLD.StatutSortie || ' | ' || :OLD.DateMAJDateSortie;
    val_apres := :NEW.IdDateSortie || ' | ' || :NEW.DateSortie || ' | ' || :NEW.RegionSortie || ' | ' || :NEW.StatutSortie || ' | ' || :NEW.DateMAJDateSortie;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, val_avant, val_apres, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_DELETE
AFTER DELETE ON DATESORTIE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdDateSortie || ' | ' || :OLD.DateSortie || ' | ' || :OLD.RegionSortie || ' | ' || :OLD.StatutSortie || ' | ' || :OLD.DateMAJDateSortie;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, val_avant, NULL, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_INSERT
AFTER INSERT ON FRANCHISE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdFranchise || ' | ' || :NEW.NomFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdFranchise, NULL, NULL, val_apres, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_UPDATE
AFTER UPDATE ON FRANCHISE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdFranchise || ' | ' || :OLD.NomFranchise;
    val_apres := :NEW.IdFranchise || ' | ' || :NEW.NomFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, val_avant, val_apres, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_DELETE
AFTER DELETE ON FRANCHISE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdFranchise || ' | ' || :OLD.NomFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, val_avant, NULL, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_INSERT
AFTER INSERT ON JEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.TitreJeu || ' | ' || :NEW.TitreVersionJeu || ' | ' || :NEW.HistoireJeu || ' | ' || :NEW.ResumeJeu || ' | ' || :NEW.ScoreAgregeJeu || ' | ' || :NEW.NombreNotesAgregeesJeu || ' | ' || :NEW.ScoreIGDB || ' | ' || :NEW.NombreNotesIGDBJeu || ' | ' || :NEW.ScoreJeu || ' | ' || :NEW.NombreNotesJeu || ' | ' || :NEW.TempsJeu_Normal || ' | ' || :NEW.TempsJeu_Rapide || ' | ' || :NEW.TempsJeu_Complet || ' | ' || :NEW.NombreTempsJeu || ' | ' || :NEW.StatutJeu || ' | ' || :NEW.DateMAJJeu || ' | ' || :NEW.VersionParent || ' | ' || :NEW.IdJeuParent || ' | ' || :NEW.FranchisePrincipaleJeu || ' | ' || :NEW.CategorieJeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_UPDATE
AFTER UPDATE ON JEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.TitreJeu || ' | ' || :OLD.TitreVersionJeu || ' | ' || :OLD.HistoireJeu || ' | ' || :OLD.ResumeJeu || ' | ' || :OLD.ScoreAgregeJeu || ' | ' || :OLD.NombreNotesAgregeesJeu || ' | ' || :OLD.ScoreIGDB || ' | ' || :OLD.NombreNotesIGDBJeu || ' | ' || :OLD.ScoreJeu || ' | ' || :OLD.NombreNotesJeu || ' | ' || :OLD.TempsJeu_Normal || ' | ' || :OLD.TempsJeu_Rapide || ' | ' || :OLD.TempsJeu_Complet || ' | ' || :OLD.NombreTempsJeu || ' | ' || :OLD.StatutJeu || ' | ' || :OLD.DateMAJJeu || ' | ' || :OLD.VersionParent || ' | ' || :OLD.IdJeuParent || ' | ' || :OLD.FranchisePrincipaleJeu || ' | ' || :OLD.CategorieJeu;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.TitreJeu || ' | ' || :NEW.TitreVersionJeu || ' | ' || :NEW.HistoireJeu || ' | ' || :NEW.ResumeJeu || ' | ' || :NEW.ScoreAgregeJeu || ' | ' || :NEW.NombreNotesAgregeesJeu || ' | ' || :NEW.ScoreIGDB || ' | ' || :NEW.NombreNotesIGDBJeu || ' | ' || :NEW.ScoreJeu || ' | ' || :NEW.NombreNotesJeu || ' | ' || :NEW.TempsJeu_Normal || ' | ' || :NEW.TempsJeu_Rapide || ' | ' || :NEW.TempsJeu_Complet || ' | ' || :NEW.NombreTempsJeu || ' | ' || :NEW.StatutJeu || ' | ' || :NEW.DateMAJJeu || ' | ' || :NEW.VersionParent || ' | ' || :NEW.IdJeuParent || ' | ' || :NEW.FranchisePrincipaleJeu || ' | ' || :NEW.CategorieJeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_DELETE
AFTER DELETE ON JEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.TitreJeu || ' | ' || :OLD.TitreVersionJeu || ' | ' || :OLD.HistoireJeu || ' | ' || :OLD.ResumeJeu || ' | ' || :OLD.ScoreAgregeJeu || ' | ' || :OLD.NombreNotesAgregeesJeu || ' | ' || :OLD.ScoreIGDB || ' | ' || :OLD.NombreNotesIGDBJeu || ' | ' || :OLD.ScoreJeu || ' | ' || :OLD.NombreNotesJeu || ' | ' || :OLD.TempsJeu_Normal || ' | ' || :OLD.TempsJeu_Rapide || ' | ' || :OLD.TempsJeu_Complet || ' | ' || :OLD.NombreTempsJeu || ' | ' || :OLD.StatutJeu || ' | ' || :OLD.DateMAJJeu || ' | ' || :OLD.VersionParent || ' | ' || :OLD.IdJeuParent || ' | ' || :OLD.FranchisePrincipaleJeu || ' | ' || :OLD.CategorieJeu;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_INSERT
AFTER INSERT ON GENRE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdGenre || ' | ' || :NEW.NomGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdGenre, NULL, NULL, val_apres, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_UPDATE
AFTER UPDATE ON GENRE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdGenre || ' | ' || :OLD.NomGenre;
    val_apres := :NEW.IdGenre || ' | ' || :NEW.NomGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdGenre, NULL, val_avant, val_apres, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_DELETE
AFTER DELETE ON GENRE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdGenre || ' | ' || :OLD.NomGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdGenre, NULL, val_avant, NULL, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_INSERT
AFTER INSERT ON MODALITE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdModalite || ' | ' || :NEW.NomModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdModalite, NULL, NULL, val_apres, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_UPDATE
AFTER UPDATE ON MODALITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdModalite || ' | ' || :OLD.NomModalite;
    val_apres := :NEW.IdModalite || ' | ' || :NEW.NomModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdModalite, NULL, val_avant, val_apres, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_DELETE
AFTER DELETE ON MODALITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdModalite || ' | ' || :OLD.NomModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdModalite, NULL, val_avant, NULL, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_INSERT
AFTER INSERT ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdModeMultiJoueur || ' | ' || :NEW.DropIn || ' | ' || :NEW.ModeCoopCampagne || ' | ' || :NEW.ModeCoopLAN || ' | ' || :NEW.ModeCoopOffline || ' | ' || :NEW.ModeCoopOnline || ' | ' || :NEW.ModeSplitScreen || ' | ' || :NEW.NbJoueursMaxCoopOffline || ' | ' || :NEW.NbJoueursMaxOffline || ' | ' || :NEW.NbJoueursMaxCoopOnline || ' | ' || :NEW.NbJoueursMaxOnline || ' | ' || :NEW.IdJeu || ' | ' || :NEW.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdModeMultiJoueur, NULL, NULL, val_apres, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_UPDATE
AFTER UPDATE ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdModeMultiJoueur || ' | ' || :OLD.DropIn || ' | ' || :OLD.ModeCoopCampagne || ' | ' || :OLD.ModeCoopLAN || ' | ' || :OLD.ModeCoopOffline || ' | ' || :OLD.ModeCoopOnline || ' | ' || :OLD.ModeSplitScreen || ' | ' || :OLD.NbJoueursMaxCoopOffline || ' | ' || :OLD.NbJoueursMaxOffline || ' | ' || :OLD.NbJoueursMaxCoopOnline || ' | ' || :OLD.NbJoueursMaxOnline || ' | ' || :OLD.IdJeu || ' | ' || :OLD.IdPlateforme;
    val_apres := :NEW.IdModeMultiJoueur || ' | ' || :NEW.DropIn || ' | ' || :NEW.ModeCoopCampagne || ' | ' || :NEW.ModeCoopLAN || ' | ' || :NEW.ModeCoopOffline || ' | ' || :NEW.ModeCoopOnline || ' | ' || :NEW.ModeSplitScreen || ' | ' || :NEW.NbJoueursMaxCoopOffline || ' | ' || :NEW.NbJoueursMaxOffline || ' | ' || :NEW.NbJoueursMaxCoopOnline || ' | ' || :NEW.NbJoueursMaxOnline || ' | ' || :NEW.IdJeu || ' | ' || :NEW.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, val_avant, val_apres, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_DELETE
AFTER DELETE ON MODEMULTIJOUEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdModeMultiJoueur || ' | ' || :OLD.DropIn || ' | ' || :OLD.ModeCoopCampagne || ' | ' || :OLD.ModeCoopLAN || ' | ' || :OLD.ModeCoopOffline || ' | ' || :OLD.ModeCoopOnline || ' | ' || :OLD.ModeSplitScreen || ' | ' || :OLD.NbJoueursMaxCoopOffline || ' | ' || :OLD.NbJoueursMaxOffline || ' | ' || :OLD.NbJoueursMaxCoopOnline || ' | ' || :OLD.NbJoueursMaxOnline || ' | ' || :OLD.IdJeu || ' | ' || :OLD.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, val_avant, NULL, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_INSERT
AFTER INSERT ON MOTCLE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdMotCle || ' | ' || :NEW.NomMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdMotCle, NULL, NULL, val_apres, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_UPDATE
AFTER UPDATE ON MOTCLE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMotCle || ' | ' || :OLD.NomMotCle;
    val_apres := :NEW.IdMotCle || ' | ' || :NEW.NomMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, val_avant, val_apres, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_DELETE
AFTER DELETE ON MOTCLE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMotCle || ' | ' || :OLD.NomMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, val_avant, NULL, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_INSERT
AFTER INSERT ON MOTEUR
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdMoteur || ' | ' || :NEW.NomMoteur || ' | ' || :NEW.DescrMoteur || ' | ' || :NEW.DateMAJMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdMoteur, NULL, NULL, val_apres, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_UPDATE
AFTER UPDATE ON MOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMoteur || ' | ' || :OLD.NomMoteur || ' | ' || :OLD.DescrMoteur || ' | ' || :OLD.DateMAJMoteur;
    val_apres := :NEW.IdMoteur || ' | ' || :NEW.NomMoteur || ' | ' || :NEW.DescrMoteur || ' | ' || :NEW.DateMAJMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, val_avant, val_apres, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_DELETE
AFTER DELETE ON MOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMoteur || ' | ' || :OLD.NomMoteur || ' | ' || :OLD.DescrMoteur || ' | ' || :OLD.DateMAJMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, val_avant, NULL, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_INSERT
AFTER INSERT ON PLATEFORME
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdPlateforme || ' | ' || :NEW.NomPlateforme || ' | ' || :NEW.AbbreviationPlateforme || ' | ' || :NEW.NomAlternatifPlateforme || ' | ' || :NEW.DescriptifPlateforme || ' | ' || :NEW.GenerationPlateforme || ' | ' || :NEW.IdCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdPlateforme, NULL, NULL, val_apres, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_UPDATE
AFTER UPDATE ON PLATEFORME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdPlateforme || ' | ' || :OLD.NomPlateforme || ' | ' || :OLD.AbbreviationPlateforme || ' | ' || :OLD.NomAlternatifPlateforme || ' | ' || :OLD.DescriptifPlateforme || ' | ' || :OLD.GenerationPlateforme || ' | ' || :OLD.IdCategoriePlateforme;
    val_apres := :NEW.IdPlateforme || ' | ' || :NEW.NomPlateforme || ' | ' || :NEW.AbbreviationPlateforme || ' | ' || :NEW.NomAlternatifPlateforme || ' | ' || :NEW.DescriptifPlateforme || ' | ' || :NEW.GenerationPlateforme || ' | ' || :NEW.IdCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, val_avant, val_apres, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_DELETE
AFTER DELETE ON PLATEFORME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdPlateforme || ' | ' || :OLD.NomPlateforme || ' | ' || :OLD.AbbreviationPlateforme || ' | ' || :OLD.NomAlternatifPlateforme || ' | ' || :OLD.DescriptifPlateforme || ' | ' || :OLD.GenerationPlateforme || ' | ' || :OLD.IdCategoriePlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, val_avant, NULL, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_INSERT
AFTER INSERT ON POPULARITE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.MesurePopularite || ' | ' || :NEW.ValeurPopularite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.MesurePopularite, NULL, NULL, val_apres, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_UPDATE
AFTER UPDATE ON POPULARITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.MesurePopularite || ' | ' || :OLD.ValeurPopularite;
    val_apres := :NEW.MesurePopularite || ' | ' || :NEW.ValeurPopularite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, val_avant, val_apres, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_DELETE
AFTER DELETE ON POPULARITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.MesurePopularite || ' | ' || :OLD.ValeurPopularite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, val_avant, NULL, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_INSERT
AFTER INSERT ON REGION
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdRegion || ' | ' || :NEW.NomRegion;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdRegion, NULL, NULL, val_apres, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_UPDATE
AFTER UPDATE ON REGION
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdRegion || ' | ' || :OLD.NomRegion;
    val_apres := :NEW.IdRegion || ' | ' || :NEW.NomRegion;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdRegion, NULL, val_avant, val_apres, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_DELETE
AFTER DELETE ON REGION
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdRegion || ' | ' || :OLD.NomRegion;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdRegion, NULL, val_avant, NULL, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_INSERT
AFTER INSERT ON THEME
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdTheme || ' | ' || :NEW.NomTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdTheme, NULL, NULL, val_apres, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_UPDATE
AFTER UPDATE ON THEME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdTheme || ' | ' || :OLD.NomTheme;
    val_apres := :NEW.IdTheme || ' | ' || :NEW.NomTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdTheme, NULL, val_avant, val_apres, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_DELETE
AFTER DELETE ON THEME
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdTheme || ' | ' || :OLD.NomTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdTheme, NULL, val_avant, NULL, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_INSERT
AFTER INSERT ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdTitreAlternatif, NULL, NULL, val_apres, 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_UPDATE
AFTER UPDATE ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif;
    val_apres := :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, val_avant, val_apres, 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_DELETE
AFTER DELETE ON TITREALTERNATIF
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, val_avant, NULL, 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_INSERT
AFTER INSERT ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdCompagnie || ' | ' || :NEW.EstDeveloppeur || ' | ' || :NEW.EstPorteur || ' | ' || :NEW.EstPublieur || ' | ' || :NEW.EstSoutien;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_UPDATE
AFTER UPDATE ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdCompagnie || ' | ' || :OLD.EstDeveloppeur || ' | ' || :OLD.EstPorteur || ' | ' || :OLD.EstPublieur || ' | ' || :OLD.EstSoutien;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdCompagnie || ' | ' || :NEW.EstDeveloppeur || ' | ' || :NEW.EstPorteur || ' | ' || :NEW.EstPublieur || ' | ' || :NEW.EstSoutien;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_DELETE
AFTER DELETE ON COMPAGNIEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdCompagnie || ' | ' || :OLD.EstDeveloppeur || ' | ' || :OLD.EstPorteur || ' | ' || :OLD.EstPublieur || ' | ' || :OLD.EstSoutien;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_INSERT
AFTER INSERT ON MODALITEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_UPDATE
AFTER UPDATE ON MODALITEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdModalite;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_DELETE
AFTER DELETE ON MODALITEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdModalite;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_INSERT
AFTER INSERT ON GENREJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_UPDATE
AFTER UPDATE ON GENREJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdGenre;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_DELETE
AFTER DELETE ON GENREJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdGenre;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_INSERT
AFTER INSERT ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_UPDATE
AFTER UPDATE ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_DELETE
AFTER DELETE ON TITREALTERNATIFJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_INSERT
AFTER INSERT ON SIMILARITE
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdJeuSimilaire;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_UPDATE
AFTER UPDATE ON SIMILARITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdJeuSimilaire;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdJeuSimilaire;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_DELETE
AFTER DELETE ON SIMILARITE
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdJeuSimilaire;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_INSERT
AFTER INSERT ON MOTCLEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_UPDATE
AFTER UPDATE ON MOTCLEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdMotCle;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_DELETE
AFTER DELETE ON MOTCLEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdMotCle;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_INSERT
AFTER INSERT ON THEMEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_UPDATE
AFTER UPDATE ON THEMEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdTheme;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_DELETE
AFTER DELETE ON THEMEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdTheme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_INSERT
AFTER INSERT ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_UPDATE
AFTER UPDATE ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdClassification;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_DELETE
AFTER DELETE ON CLASSIFICATIONJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdClassification;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_INSERT
AFTER INSERT ON MOTEURJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_UPDATE
AFTER UPDATE ON MOTEURJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdMoteur;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_DELETE
AFTER DELETE ON MOTEURJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_INSERT
AFTER INSERT ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdCompagnie || ' | ' || :NEW.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, val_apres, 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_UPDATE
AFTER UPDATE ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCompagnie || ' | ' || :OLD.IdMoteur;
    val_apres := :NEW.IdCompagnie || ' | ' || :NEW.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, val_avant, val_apres, 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_DELETE
AFTER DELETE ON COMPAGNIEMOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdCompagnie || ' | ' || :OLD.IdMoteur;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, val_avant, NULL, 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_INSERT
AFTER INSERT ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdMoteur || ' | ' || :NEW.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdMoteur, NULL, NULL, val_apres, 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_UPDATE
AFTER UPDATE ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMoteur || ' | ' || :OLD.IdPlateforme;
    val_apres := :NEW.IdMoteur || ' | ' || :NEW.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, val_avant, val_apres, 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_DELETE
AFTER DELETE ON PLATEFORMEMOTEUR
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdMoteur || ' | ' || :OLD.IdPlateforme;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, val_avant, NULL, 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_INSERT
AFTER INSERT ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_UPDATE
AFTER UPDATE ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdFranchise;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_DELETE
AFTER DELETE ON FRANCHISEJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdFranchise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_INSERT
AFTER INSERT ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    val_apres VARCHAR2(4000);
BEGIN
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdRegion || ' | ' || :NEW.TitreLocalise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, val_apres, 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_UPDATE
AFTER UPDATE ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
    val_apres VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdRegion || ' | ' || :OLD.TitreLocalise;
    val_apres := :NEW.IdJeu || ' | ' || :NEW.IdRegion || ' | ' || :NEW.TitreLocalise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, val_apres, 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_DELETE
AFTER DELETE ON LOCALISATIONJEU
FOR EACH ROW
DECLARE
    val_avant VARCHAR2(4000);
BEGIN
    val_avant := :OLD.IdJeu || ' | ' || :OLD.IdRegion || ' | ' || :OLD.TitreLocalise;
    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, val_avant, NULL, 'LOCALISATIONJEU');
END;
/


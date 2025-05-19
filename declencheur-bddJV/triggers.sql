CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCategorieJeu, NULL, NULL, :NEW.IdCategorieJeu || ' | ' || :NEW.NomGenre , 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, :OLD.IdCategorieJeu || ' | ' || :OLD.NomGenre , :NEW.IdCategorieJeu || ' | ' || :NEW.NomGenre , 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, :OLD.IdCategorieJeu || ' | ' || :OLD.NomGenre , NULL, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_INSERT
AFTER INSERT ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCategoriePlateforme, NULL, NULL, :NEW.IdCategoriePlateforme || ' | ' || :NEW.NomCategoriePlateforme , 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_UPDATE
AFTER UPDATE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, :OLD.IdCategoriePlateforme || ' | ' || :OLD.NomCategoriePlateforme , :NEW.IdCategoriePlateforme || ' | ' || :NEW.NomCategoriePlateforme , 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_DELETE
AFTER DELETE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, :OLD.IdCategoriePlateforme || ' | ' || :OLD.NomCategoriePlateforme , NULL, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_INSERT
AFTER INSERT ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdClassification, NULL, NULL, :NEW.IdClassification || ' | ' || :NEW.OrganismeClassification || ' | ' || :NEW.Classification || ' | ' || :NEW.SynopsisClassification , 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_UPDATE
AFTER UPDATE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdClassification, NULL, :OLD.IdClassification || ' | ' || :OLD.OrganismeClassification || ' | ' || :OLD.Classification || ' | ' || :OLD.SynopsisClassification , :NEW.IdClassification || ' | ' || :NEW.OrganismeClassification || ' | ' || :NEW.Classification || ' | ' || :NEW.SynopsisClassification , 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_DELETE
AFTER DELETE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdClassification, NULL, :OLD.IdClassification || ' | ' || :OLD.OrganismeClassification || ' | ' || :OLD.Classification || ' | ' || :OLD.SynopsisClassification , NULL, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_INSERT
AFTER INSERT ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, :NEW.IdCompagnie || ' | ' || :NEW.nomCompagnie || ' | ' || :NEW.DescrCompagnie || ' | ' || :NEW.PaysCompagnie || ' | ' || :NEW.DateFondationCompagnie || ' | ' || :NEW.DateMAJCompagnie , 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_UPDATE
AFTER UPDATE ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, :OLD.IdCompagnie || ' | ' || :OLD.nomCompagnie || ' | ' || :OLD.DescrCompagnie || ' | ' || :OLD.PaysCompagnie || ' | ' || :OLD.DateFondationCompagnie || ' | ' || :OLD.DateMAJCompagnie , :NEW.IdCompagnie || ' | ' || :NEW.nomCompagnie || ' | ' || :NEW.DescrCompagnie || ' | ' || :NEW.PaysCompagnie || ' | ' || :NEW.DateFondationCompagnie || ' | ' || :NEW.DateMAJCompagnie , 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_DELETE
AFTER DELETE ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, :OLD.IdCompagnie || ' | ' || :OLD.nomCompagnie || ' | ' || :OLD.DescrCompagnie || ' | ' || :OLD.PaysCompagnie || ' | ' || :OLD.DateFondationCompagnie || ' | ' || :OLD.DateMAJCompagnie , NULL, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_INSERT
AFTER INSERT ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdDateSortie, NULL, NULL, :NEW.IdDateSortie || ' | ' || :NEW.DateSortie || ' | ' || :NEW.RegionSortie || ' | ' || :NEW.StatutSortie || ' | ' || :NEW.DateMAJDateSortie , 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_UPDATE
AFTER UPDATE ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, :OLD.IdDateSortie || ' | ' || :OLD.DateSortie || ' | ' || :OLD.RegionSortie || ' | ' || :OLD.StatutSortie || ' | ' || :OLD.DateMAJDateSortie , :NEW.IdDateSortie || ' | ' || :NEW.DateSortie || ' | ' || :NEW.RegionSortie || ' | ' || :NEW.StatutSortie || ' | ' || :NEW.DateMAJDateSortie , 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_DELETE
AFTER DELETE ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, :OLD.IdDateSortie || ' | ' || :OLD.DateSortie || ' | ' || :OLD.RegionSortie || ' | ' || :OLD.StatutSortie || ' | ' || :OLD.DateMAJDateSortie , NULL, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_INSERT
AFTER INSERT ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdFranchise, NULL, NULL, :NEW.IdFranchise || ' | ' || :NEW.NomFranchise , 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_UPDATE
AFTER UPDATE ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, :OLD.IdFranchise || ' | ' || :OLD.NomFranchise , :NEW.IdFranchise || ' | ' || :NEW.NomFranchise , 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_DELETE
AFTER DELETE ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, :OLD.IdFranchise || ' | ' || :OLD.NomFranchise , NULL, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_INSERT
AFTER INSERT ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, :NEW.IdJeu || ' | ' || :NEW.TitreJeu || ' | ' || :NEW.TitreVersionJeu || ' | ' || :NEW.HistoireJeu || ' | ' || :NEW.ResumeJeu || ' | ' || :NEW.ScoreAgregeJeu || ' | ' || :NEW.NombreNotesAgregeesJeu || ' | ' || :NEW.ScoreIGDB || ' | ' || :NEW.NombreNotesIGDBJeu || ' | ' || :NEW.ScoreJeu || ' | ' || :NEW.NombreNotesJeu || ' | ' || :NEW.TempsJeu_Normal || ' | ' || :NEW.TempsJeu_Rapide || ' | ' || :NEW.TempsJeu_Complet || ' | ' || :NEW.NombreTempsJeu || ' | ' || :NEW.StatutJeu || ' | ' || :NEW.DateMAJJeu , 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_UPDATE
AFTER UPDATE ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, :OLD.IdJeu || ' | ' || :OLD.TitreJeu || ' | ' || :OLD.TitreVersionJeu || ' | ' || :OLD.HistoireJeu || ' | ' || :OLD.ResumeJeu || ' | ' || :OLD.ScoreAgregeJeu || ' | ' || :OLD.NombreNotesAgregeesJeu || ' | ' || :OLD.ScoreIGDB || ' | ' || :OLD.NombreNotesIGDBJeu || ' | ' || :OLD.ScoreJeu || ' | ' || :OLD.NombreNotesJeu || ' | ' || :OLD.TempsJeu_Normal || ' | ' || :OLD.TempsJeu_Rapide || ' | ' || :OLD.TempsJeu_Complet || ' | ' || :OLD.NombreTempsJeu || ' | ' || :OLD.StatutJeu || ' | ' || :OLD.DateMAJJeu , :NEW.IdJeu || ' | ' || :NEW.TitreJeu || ' | ' || :NEW.TitreVersionJeu || ' | ' || :NEW.HistoireJeu || ' | ' || :NEW.ResumeJeu || ' | ' || :NEW.ScoreAgregeJeu || ' | ' || :NEW.NombreNotesAgregeesJeu || ' | ' || :NEW.ScoreIGDB || ' | ' || :NEW.NombreNotesIGDBJeu || ' | ' || :NEW.ScoreJeu || ' | ' || :NEW.NombreNotesJeu || ' | ' || :NEW.TempsJeu_Normal || ' | ' || :NEW.TempsJeu_Rapide || ' | ' || :NEW.TempsJeu_Complet || ' | ' || :NEW.NombreTempsJeu || ' | ' || :NEW.StatutJeu || ' | ' || :NEW.DateMAJJeu , 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_DELETE
AFTER DELETE ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, :OLD.IdJeu || ' | ' || :OLD.TitreJeu || ' | ' || :OLD.TitreVersionJeu || ' | ' || :OLD.HistoireJeu || ' | ' || :OLD.ResumeJeu || ' | ' || :OLD.ScoreAgregeJeu || ' | ' || :OLD.NombreNotesAgregeesJeu || ' | ' || :OLD.ScoreIGDB || ' | ' || :OLD.NombreNotesIGDBJeu || ' | ' || :OLD.ScoreJeu || ' | ' || :OLD.NombreNotesJeu || ' | ' || :OLD.TempsJeu_Normal || ' | ' || :OLD.TempsJeu_Rapide || ' | ' || :OLD.TempsJeu_Complet || ' | ' || :OLD.NombreTempsJeu || ' | ' || :OLD.StatutJeu || ' | ' || :OLD.DateMAJJeu , NULL, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_INSERT
AFTER INSERT ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdGenre, NULL, NULL, :NEW.IdGenre || ' | ' || :NEW.NomGenre , 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_UPDATE
AFTER UPDATE ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdGenre, NULL, :OLD.IdGenre || ' | ' || :OLD.NomGenre , :NEW.IdGenre || ' | ' || :NEW.NomGenre , 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_DELETE
AFTER DELETE ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdGenre, NULL, :OLD.IdGenre || ' | ' || :OLD.NomGenre , NULL, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_INSERT
AFTER INSERT ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdModalite, NULL, NULL, :NEW.IdModalite || ' | ' || :NEW.NomModalite , 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_UPDATE
AFTER UPDATE ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdModalite, NULL, :OLD.IdModalite || ' | ' || :OLD.NomModalite , :NEW.IdModalite || ' | ' || :NEW.NomModalite , 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_DELETE
AFTER DELETE ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdModalite, NULL, :OLD.IdModalite || ' | ' || :OLD.NomModalite , NULL, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_INSERT
AFTER INSERT ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdModeMultiJoueur, NULL, NULL, :NEW.IdModeMultiJoueur || ' | ' || :NEW.DropIn || ' | ' || :NEW.ModeCoopCampagne || ' | ' || :NEW.ModeCoopLAN || ' | ' || :NEW.ModeCoopOffline || ' | ' || :NEW.ModeCoopOnline || ' | ' || :NEW.ModeSplitScreen || ' | ' || :NEW.NbJoueursMaxCoopOffline || ' | ' || :NEW.NbJoueursMaxOffline || ' | ' || :NEW.NbJoueursMaxCoopOnline || ' | ' || :NEW.NbJoueursMaxOnline , 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_UPDATE
AFTER UPDATE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, :OLD.IdModeMultiJoueur || ' | ' || :OLD.DropIn || ' | ' || :OLD.ModeCoopCampagne || ' | ' || :OLD.ModeCoopLAN || ' | ' || :OLD.ModeCoopOffline || ' | ' || :OLD.ModeCoopOnline || ' | ' || :OLD.ModeSplitScreen || ' | ' || :OLD.NbJoueursMaxCoopOffline || ' | ' || :OLD.NbJoueursMaxOffline || ' | ' || :OLD.NbJoueursMaxCoopOnline || ' | ' || :OLD.NbJoueursMaxOnline , :NEW.IdModeMultiJoueur || ' | ' || :NEW.DropIn || ' | ' || :NEW.ModeCoopCampagne || ' | ' || :NEW.ModeCoopLAN || ' | ' || :NEW.ModeCoopOffline || ' | ' || :NEW.ModeCoopOnline || ' | ' || :NEW.ModeSplitScreen || ' | ' || :NEW.NbJoueursMaxCoopOffline || ' | ' || :NEW.NbJoueursMaxOffline || ' | ' || :NEW.NbJoueursMaxCoopOnline || ' | ' || :NEW.NbJoueursMaxOnline , 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_DELETE
AFTER DELETE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, :OLD.IdModeMultiJoueur || ' | ' || :OLD.DropIn || ' | ' || :OLD.ModeCoopCampagne || ' | ' || :OLD.ModeCoopLAN || ' | ' || :OLD.ModeCoopOffline || ' | ' || :OLD.ModeCoopOnline || ' | ' || :OLD.ModeSplitScreen || ' | ' || :OLD.NbJoueursMaxCoopOffline || ' | ' || :OLD.NbJoueursMaxOffline || ' | ' || :OLD.NbJoueursMaxCoopOnline || ' | ' || :OLD.NbJoueursMaxOnline , NULL, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_INSERT
AFTER INSERT ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdMotCle, NULL, NULL, :NEW.IdMotCle || ' | ' || :NEW.NomMotCle , 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_UPDATE
AFTER UPDATE ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, :OLD.IdMotCle || ' | ' || :OLD.NomMotCle , :NEW.IdMotCle || ' | ' || :NEW.NomMotCle , 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_DELETE
AFTER DELETE ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, :OLD.IdMotCle || ' | ' || :OLD.NomMotCle , NULL, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_INSERT
AFTER INSERT ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdMoteur, NULL, NULL, :NEW.IdMoteur || ' | ' || :NEW.NomMoteur || ' | ' || :NEW.DescrMoteur || ' | ' || :NEW.DateMAJMoteur , 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_UPDATE
AFTER UPDATE ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, :OLD.IdMoteur || ' | ' || :OLD.NomMoteur || ' | ' || :OLD.DescrMoteur || ' | ' || :OLD.DateMAJMoteur , :NEW.IdMoteur || ' | ' || :NEW.NomMoteur || ' | ' || :NEW.DescrMoteur || ' | ' || :NEW.DateMAJMoteur , 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_DELETE
AFTER DELETE ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, :OLD.IdMoteur || ' | ' || :OLD.NomMoteur || ' | ' || :OLD.DescrMoteur || ' | ' || :OLD.DateMAJMoteur , NULL, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_INSERT
AFTER INSERT ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdPlateforme, NULL, NULL, :NEW.IdPlateforme || ' | ' || :NEW.NomPlateforme || ' | ' || :NEW.AbbreviationPlateforme || ' | ' || :NEW.NomAlternatifPlateforme || ' | ' || :NEW.DescriptifPlateforme || ' | ' || :NEW.GenerationPlateforme , 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_UPDATE
AFTER UPDATE ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, :OLD.IdPlateforme || ' | ' || :OLD.NomPlateforme || ' | ' || :OLD.AbbreviationPlateforme || ' | ' || :OLD.NomAlternatifPlateforme || ' | ' || :OLD.DescriptifPlateforme || ' | ' || :OLD.GenerationPlateforme , :NEW.IdPlateforme || ' | ' || :NEW.NomPlateforme || ' | ' || :NEW.AbbreviationPlateforme || ' | ' || :NEW.NomAlternatifPlateforme || ' | ' || :NEW.DescriptifPlateforme || ' | ' || :NEW.GenerationPlateforme , 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_DELETE
AFTER DELETE ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, :OLD.IdPlateforme || ' | ' || :OLD.NomPlateforme || ' | ' || :OLD.AbbreviationPlateforme || ' | ' || :OLD.NomAlternatifPlateforme || ' | ' || :OLD.DescriptifPlateforme || ' | ' || :OLD.GenerationPlateforme , NULL, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_INSERT
AFTER INSERT ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.MesurePopularite, NULL, NULL, :NEW.MesurePopularite || ' | ' || :NEW.ValeurPopularite , 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_UPDATE
AFTER UPDATE ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, :OLD.MesurePopularite || ' | ' || :OLD.ValeurPopularite , :NEW.MesurePopularite || ' | ' || :NEW.ValeurPopularite , 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_DELETE
AFTER DELETE ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, :OLD.MesurePopularite || ' | ' || :OLD.ValeurPopularite , NULL, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_INSERT
AFTER INSERT ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdRegion, NULL, NULL, :NEW.IdRegion || ' | ' || :NEW.NomRegion , 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_UPDATE
AFTER UPDATE ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdRegion, NULL, :OLD.IdRegion || ' | ' || :OLD.NomRegion , :NEW.IdRegion || ' | ' || :NEW.NomRegion , 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_DELETE
AFTER DELETE ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdRegion, NULL, :OLD.IdRegion || ' | ' || :OLD.NomRegion , NULL, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_INSERT
AFTER INSERT ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdTheme, NULL, NULL, :NEW.IdTheme || ' | ' || :NEW.NomTheme , 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_UPDATE
AFTER UPDATE ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdTheme, NULL, :OLD.IdTheme || ' | ' || :OLD.NomTheme , :NEW.IdTheme || ' | ' || :NEW.NomTheme , 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_DELETE
AFTER DELETE ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdTheme, NULL, :OLD.IdTheme || ' | ' || :OLD.NomTheme , NULL, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_INSERT
AFTER INSERT ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdTitreAlternatif, NULL, NULL, :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif , 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_UPDATE
AFTER UPDATE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif , :NEW.IdTitreAlternatif || ' | ' || :NEW.LibelleTitreAlternatif , 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_DELETE
AFTER DELETE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, :OLD.IdTitreAlternatif || ' | ' || :OLD.LibelleTitreAlternatif , NULL, 'TITREALTERNATIF');
END;
/


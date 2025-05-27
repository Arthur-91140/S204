CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCategorieJeu, NULL, NULL, ':NEW.IdCategorieJeu || ' || ' || :NEW.NomCategoriejeu |', 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, ':OLD.IdCategorieJeu || ' || ' || :OLD.NomCategoriejeu |', ':NEW.IdCategorieJeu || ' || ' || :NEW.NomCategoriejeu |', 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCategorieJeu, NULL, ':OLD.IdCategorieJeu || ' || ' || :OLD.NomCategoriejeu |', NULL, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_INSERT
AFTER INSERT ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCategoriePlateforme, NULL, NULL, ':NEW.IdCategoriePlateforme || ' || ' || :NEW.NomCategoriePlateforme |', 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_UPDATE
AFTER UPDATE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, ':OLD.IdCategoriePlateforme || ' || ' || :OLD.NomCategoriePlateforme |', ':NEW.IdCategoriePlateforme || ' || ' || :NEW.NomCategoriePlateforme |', 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CATEGORIEPLATEFORME_DELETE
AFTER DELETE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCategoriePlateforme, NULL, ':OLD.IdCategoriePlateforme || ' || ' || :OLD.NomCategoriePlateforme |', NULL, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_INSERT
AFTER INSERT ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdClassification, NULL, NULL, ':NEW.IdClassification || ' || ' || :NEW.OrganismeClassification || ' || ' || :NEW.Classification || ' || ' || :NEW.SynopsisClassification |', 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_UPDATE
AFTER UPDATE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdClassification, NULL, ':OLD.IdClassification || ' || ' || :OLD.OrganismeClassification || ' || ' || :OLD.Classification || ' || ' || :OLD.SynopsisClassification |', ':NEW.IdClassification || ' || ' || :NEW.OrganismeClassification || ' || ' || :NEW.Classification || ' || ' || :NEW.SynopsisClassification |', 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONAGE_DELETE
AFTER DELETE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdClassification, NULL, ':OLD.IdClassification || ' || ' || :OLD.OrganismeClassification || ' || ' || :OLD.Classification || ' || ' || :OLD.SynopsisClassification |', NULL, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_INSERT
AFTER INSERT ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, ':NEW.IdCompagnie || ' || ' || :NEW.NomCompagnie || ' || ' || :NEW.DescrCompagnie || ' || ' || :NEW.PaysCompagnie || ' || ' || :NEW.DateFondationCompagnie || ' || ' || :NEW.DateMAJCompagnie || ' || ' || :NEW.CompagnieParent |', 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_UPDATE
AFTER UPDATE ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, ':OLD.IdCompagnie || ' || ' || :OLD.NomCompagnie || ' || ' || :OLD.DescrCompagnie || ' || ' || :OLD.PaysCompagnie || ' || ' || :OLD.DateFondationCompagnie || ' || ' || :OLD.DateMAJCompagnie || ' || ' || :OLD.CompagnieParent |', ':NEW.IdCompagnie || ' || ' || :NEW.NomCompagnie || ' || ' || :NEW.DescrCompagnie || ' || ' || :NEW.PaysCompagnie || ' || ' || :NEW.DateFondationCompagnie || ' || ' || :NEW.DateMAJCompagnie || ' || ' || :NEW.CompagnieParent |', 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIE_DELETE
AFTER DELETE ON COMPAGNIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, ':OLD.IdCompagnie || ' || ' || :OLD.NomCompagnie || ' || ' || :OLD.DescrCompagnie || ' || ' || :OLD.PaysCompagnie || ' || ' || :OLD.DateFondationCompagnie || ' || ' || :OLD.DateMAJCompagnie || ' || ' || :OLD.CompagnieParent |', NULL, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_INSERT
AFTER INSERT ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdDateSortie, NULL, NULL, ':NEW.IdDateSortie || ' || ' || :NEW.DateSortie || ' || ' || :NEW.RegionSortie || ' || ' || :NEW.StatutSortie || ' || ' || :NEW.DateMAJDateSortie |', 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_UPDATE
AFTER UPDATE ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, ':OLD.IdDateSortie || ' || ' || :OLD.DateSortie || ' || ' || :OLD.RegionSortie || ' || ' || :OLD.StatutSortie || ' || ' || :OLD.DateMAJDateSortie |', ':NEW.IdDateSortie || ' || ' || :NEW.DateSortie || ' || ' || :NEW.RegionSortie || ' || ' || :NEW.StatutSortie || ' || ' || :NEW.DateMAJDateSortie |', 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_DATESORTIE_DELETE
AFTER DELETE ON DATESORTIE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdDateSortie, NULL, ':OLD.IdDateSortie || ' || ' || :OLD.DateSortie || ' || ' || :OLD.RegionSortie || ' || ' || :OLD.StatutSortie || ' || ' || :OLD.DateMAJDateSortie |', NULL, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_INSERT
AFTER INSERT ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdFranchise, NULL, NULL, ':NEW.IdFranchise || ' || ' || :NEW.NomFranchise |', 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_UPDATE
AFTER UPDATE ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, ':OLD.IdFranchise || ' || ' || :OLD.NomFranchise |', ':NEW.IdFranchise || ' || ' || :NEW.NomFranchise |', 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISE_DELETE
AFTER DELETE ON FRANCHISE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdFranchise, NULL, ':OLD.IdFranchise || ' || ' || :OLD.NomFranchise |', NULL, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_INSERT
AFTER INSERT ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.TitreJeu || ' || ' || :NEW.TitreVersionJeu || ' || ' || :NEW.HistoireJeu || ' || ' || :NEW.ResumeJeu || ' || ' || :NEW.ScoreAgregeJeu || ' || ' || :NEW.NombreNotesAgregeesJeu || ' || ' || :NEW.ScoreIGDB || ' || ' || :NEW.NombreNotesIGDBJeu || ' || ' || :NEW.ScoreJeu || ' || ' || :NEW.NombreNotesJeu || ' || ' || :NEW.TempsJeu_Normal || ' || ' || :NEW.TempsJeu_Rapide || ' || ' || :NEW.TempsJeu_Complet || ' || ' || :NEW.NombreTempsJeu || ' || ' || :NEW.StatutJeu || ' || ' || :NEW.DateMAJJeu || ' || ' || :NEW.VersionParent || ' || ' || :NEW.IdJeuParent || ' || ' || :NEW.FranchisePrincipaleJeu || ' || ' || :NEW.CategorieJeu |', 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_UPDATE
AFTER UPDATE ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.TitreJeu || ' || ' || :OLD.TitreVersionJeu || ' || ' || :OLD.HistoireJeu || ' || ' || :OLD.ResumeJeu || ' || ' || :OLD.ScoreAgregeJeu || ' || ' || :OLD.NombreNotesAgregeesJeu || ' || ' || :OLD.ScoreIGDB || ' || ' || :OLD.NombreNotesIGDBJeu || ' || ' || :OLD.ScoreJeu || ' || ' || :OLD.NombreNotesJeu || ' || ' || :OLD.TempsJeu_Normal || ' || ' || :OLD.TempsJeu_Rapide || ' || ' || :OLD.TempsJeu_Complet || ' || ' || :OLD.NombreTempsJeu || ' || ' || :OLD.StatutJeu || ' || ' || :OLD.DateMAJJeu || ' || ' || :OLD.VersionParent || ' || ' || :OLD.IdJeuParent || ' || ' || :OLD.FranchisePrincipaleJeu || ' || ' || :OLD.CategorieJeu |', ':NEW.IdJeu || ' || ' || :NEW.TitreJeu || ' || ' || :NEW.TitreVersionJeu || ' || ' || :NEW.HistoireJeu || ' || ' || :NEW.ResumeJeu || ' || ' || :NEW.ScoreAgregeJeu || ' || ' || :NEW.NombreNotesAgregeesJeu || ' || ' || :NEW.ScoreIGDB || ' || ' || :NEW.NombreNotesIGDBJeu || ' || ' || :NEW.ScoreJeu || ' || ' || :NEW.NombreNotesJeu || ' || ' || :NEW.TempsJeu_Normal || ' || ' || :NEW.TempsJeu_Rapide || ' || ' || :NEW.TempsJeu_Complet || ' || ' || :NEW.NombreTempsJeu || ' || ' || :NEW.StatutJeu || ' || ' || :NEW.DateMAJJeu || ' || ' || :NEW.VersionParent || ' || ' || :NEW.IdJeuParent || ' || ' || :NEW.FranchisePrincipaleJeu || ' || ' || :NEW.CategorieJeu |', 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_JEU_DELETE
AFTER DELETE ON JEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.TitreJeu || ' || ' || :OLD.TitreVersionJeu || ' || ' || :OLD.HistoireJeu || ' || ' || :OLD.ResumeJeu || ' || ' || :OLD.ScoreAgregeJeu || ' || ' || :OLD.NombreNotesAgregeesJeu || ' || ' || :OLD.ScoreIGDB || ' || ' || :OLD.NombreNotesIGDBJeu || ' || ' || :OLD.ScoreJeu || ' || ' || :OLD.NombreNotesJeu || ' || ' || :OLD.TempsJeu_Normal || ' || ' || :OLD.TempsJeu_Rapide || ' || ' || :OLD.TempsJeu_Complet || ' || ' || :OLD.NombreTempsJeu || ' || ' || :OLD.StatutJeu || ' || ' || :OLD.DateMAJJeu || ' || ' || :OLD.VersionParent || ' || ' || :OLD.IdJeuParent || ' || ' || :OLD.FranchisePrincipaleJeu || ' || ' || :OLD.CategorieJeu |', NULL, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_INSERT
AFTER INSERT ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdGenre, NULL, NULL, ':NEW.IdGenre || ' || ' || :NEW.NomGenre |', 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_UPDATE
AFTER UPDATE ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdGenre, NULL, ':OLD.IdGenre || ' || ' || :OLD.NomGenre |', ':NEW.IdGenre || ' || ' || :NEW.NomGenre |', 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENRE_DELETE
AFTER DELETE ON GENRE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdGenre, NULL, ':OLD.IdGenre || ' || ' || :OLD.NomGenre |', NULL, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_INSERT
AFTER INSERT ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdModalite, NULL, NULL, ':NEW.IdModalite || ' || ' || :NEW.NomModalite |', 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_UPDATE
AFTER UPDATE ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdModalite, NULL, ':OLD.IdModalite || ' || ' || :OLD.NomModalite |', ':NEW.IdModalite || ' || ' || :NEW.NomModalite |', 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITE_DELETE
AFTER DELETE ON MODALITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdModalite, NULL, ':OLD.IdModalite || ' || ' || :OLD.NomModalite |', NULL, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_INSERT
AFTER INSERT ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdModeMultiJoueur, NULL, NULL, ':NEW.IdModeMultiJoueur || ' || ' || :NEW.DropIn || ' || ' || :NEW.ModeCoopCampagne || ' || ' || :NEW.ModeCoopLAN || ' || ' || :NEW.ModeCoopOffline || ' || ' || :NEW.ModeCoopOnline || ' || ' || :NEW.ModeSplitScreen || ' || ' || :NEW.NbJoueursMaxCoopOffline || ' || ' || :NEW.NbJoueursMaxOffline || ' || ' || :NEW.NbJoueursMaxCoopOnline || ' || ' || :NEW.NbJoueursMaxOnline || ' || ' || :NEW.IdJeu || ' || ' || :NEW.IdPlateforme |', 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_UPDATE
AFTER UPDATE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, ':OLD.IdModeMultiJoueur || ' || ' || :OLD.DropIn || ' || ' || :OLD.ModeCoopCampagne || ' || ' || :OLD.ModeCoopLAN || ' || ' || :OLD.ModeCoopOffline || ' || ' || :OLD.ModeCoopOnline || ' || ' || :OLD.ModeSplitScreen || ' || ' || :OLD.NbJoueursMaxCoopOffline || ' || ' || :OLD.NbJoueursMaxOffline || ' || ' || :OLD.NbJoueursMaxCoopOnline || ' || ' || :OLD.NbJoueursMaxOnline || ' || ' || :OLD.IdJeu || ' || ' || :OLD.IdPlateforme |', ':NEW.IdModeMultiJoueur || ' || ' || :NEW.DropIn || ' || ' || :NEW.ModeCoopCampagne || ' || ' || :NEW.ModeCoopLAN || ' || ' || :NEW.ModeCoopOffline || ' || ' || :NEW.ModeCoopOnline || ' || ' || :NEW.ModeSplitScreen || ' || ' || :NEW.NbJoueursMaxCoopOffline || ' || ' || :NEW.NbJoueursMaxOffline || ' || ' || :NEW.NbJoueursMaxCoopOnline || ' || ' || :NEW.NbJoueursMaxOnline || ' || ' || :NEW.IdJeu || ' || ' || :NEW.IdPlateforme |', 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODEMULTIJOUEUR_DELETE
AFTER DELETE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdModeMultiJoueur, NULL, ':OLD.IdModeMultiJoueur || ' || ' || :OLD.DropIn || ' || ' || :OLD.ModeCoopCampagne || ' || ' || :OLD.ModeCoopLAN || ' || ' || :OLD.ModeCoopOffline || ' || ' || :OLD.ModeCoopOnline || ' || ' || :OLD.ModeSplitScreen || ' || ' || :OLD.NbJoueursMaxCoopOffline || ' || ' || :OLD.NbJoueursMaxOffline || ' || ' || :OLD.NbJoueursMaxCoopOnline || ' || ' || :OLD.NbJoueursMaxOnline || ' || ' || :OLD.IdJeu || ' || ' || :OLD.IdPlateforme |', NULL, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_INSERT
AFTER INSERT ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdMotCle, NULL, NULL, ':NEW.IdMotCle || ' || ' || :NEW.NomMotCle |', 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_UPDATE
AFTER UPDATE ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, ':OLD.IdMotCle || ' || ' || :OLD.NomMotCle |', ':NEW.IdMotCle || ' || ' || :NEW.NomMotCle |', 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLE_DELETE
AFTER DELETE ON MOTCLE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdMotCle, NULL, ':OLD.IdMotCle || ' || ' || :OLD.NomMotCle |', NULL, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_INSERT
AFTER INSERT ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdMoteur, NULL, NULL, ':NEW.IdMoteur || ' || ' || :NEW.NomMoteur || ' || ' || :NEW.DescrMoteur || ' || ' || :NEW.DateMAJMoteur |', 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_UPDATE
AFTER UPDATE ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, ':OLD.IdMoteur || ' || ' || :OLD.NomMoteur || ' || ' || :OLD.DescrMoteur || ' || ' || :OLD.DateMAJMoteur |', ':NEW.IdMoteur || ' || ' || :NEW.NomMoteur || ' || ' || :NEW.DescrMoteur || ' || ' || :NEW.DateMAJMoteur |', 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEUR_DELETE
AFTER DELETE ON MOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, ':OLD.IdMoteur || ' || ' || :OLD.NomMoteur || ' || ' || :OLD.DescrMoteur || ' || ' || :OLD.DateMAJMoteur |', NULL, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_INSERT
AFTER INSERT ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdPlateforme, NULL, NULL, ':NEW.IdPlateforme || ' || ' || :NEW.NomPlateforme || ' || ' || :NEW.AbbreviationPlateforme || ' || ' || :NEW.NomAlternatifPlateforme || ' || ' || :NEW.DescriptifPlateforme || ' || ' || :NEW.GenerationPlateforme || ' || ' || :NEW.IdCategoriePlateforme |', 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_UPDATE
AFTER UPDATE ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, ':OLD.IdPlateforme || ' || ' || :OLD.NomPlateforme || ' || ' || :OLD.AbbreviationPlateforme || ' || ' || :OLD.NomAlternatifPlateforme || ' || ' || :OLD.DescriptifPlateforme || ' || ' || :OLD.GenerationPlateforme || ' || ' || :OLD.IdCategoriePlateforme |', ':NEW.IdPlateforme || ' || ' || :NEW.NomPlateforme || ' || ' || :NEW.AbbreviationPlateforme || ' || ' || :NEW.NomAlternatifPlateforme || ' || ' || :NEW.DescriptifPlateforme || ' || ' || :NEW.GenerationPlateforme || ' || ' || :NEW.IdCategoriePlateforme |', 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORME_DELETE
AFTER DELETE ON PLATEFORME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdPlateforme, NULL, ':OLD.IdPlateforme || ' || ' || :OLD.NomPlateforme || ' || ' || :OLD.AbbreviationPlateforme || ' || ' || :OLD.NomAlternatifPlateforme || ' || ' || :OLD.DescriptifPlateforme || ' || ' || :OLD.GenerationPlateforme || ' || ' || :OLD.IdCategoriePlateforme |', NULL, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_INSERT
AFTER INSERT ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.MesurePopularite, NULL, NULL, ':NEW.MesurePopularite || ' || ' || :NEW.ValeurPopularite |', 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_UPDATE
AFTER UPDATE ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, ':OLD.MesurePopularite || ' || ' || :OLD.ValeurPopularite |', ':NEW.MesurePopularite || ' || ' || :NEW.ValeurPopularite |', 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_POPULARITE_DELETE
AFTER DELETE ON POPULARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.MesurePopularite, NULL, ':OLD.MesurePopularite || ' || ' || :OLD.ValeurPopularite |', NULL, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_INSERT
AFTER INSERT ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdRegion, NULL, NULL, ':NEW.IdRegion || ' || ' || :NEW.NomRegion |', 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_UPDATE
AFTER UPDATE ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdRegion, NULL, ':OLD.IdRegion || ' || ' || :OLD.NomRegion |', ':NEW.IdRegion || ' || ' || :NEW.NomRegion |', 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_REGION_DELETE
AFTER DELETE ON REGION
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdRegion, NULL, ':OLD.IdRegion || ' || ' || :OLD.NomRegion |', NULL, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_INSERT
AFTER INSERT ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdTheme, NULL, NULL, ':NEW.IdTheme || ' || ' || :NEW.NomTheme |', 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_UPDATE
AFTER UPDATE ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdTheme, NULL, ':OLD.IdTheme || ' || ' || :OLD.NomTheme |', ':NEW.IdTheme || ' || ' || :NEW.NomTheme |', 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEME_DELETE
AFTER DELETE ON THEME
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdTheme, NULL, ':OLD.IdTheme || ' || ' || :OLD.NomTheme |', NULL, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_INSERT
AFTER INSERT ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdTitreAlternatif, NULL, NULL, ':NEW.IdTitreAlternatif || ' || ' || :NEW.LibelleTitreAlternatif |', 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_UPDATE
AFTER UPDATE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, ':OLD.IdTitreAlternatif || ' || ' || :OLD.LibelleTitreAlternatif |', ':NEW.IdTitreAlternatif || ' || ' || :NEW.LibelleTitreAlternatif |', 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIF_DELETE
AFTER DELETE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdTitreAlternatif, NULL, ':OLD.IdTitreAlternatif || ' || ' || :OLD.LibelleTitreAlternatif |', NULL, 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_INSERT
AFTER INSERT ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdCompagnie || ' || ' || :NEW.EstDeveloppeur || ' || ' || :NEW.EstPorteur || ' || ' || :NEW.EstPublieur || ' || ' || :NEW.EstSoutien |', 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_UPDATE
AFTER UPDATE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdCompagnie || ' || ' || :OLD.EstDeveloppeur || ' || ' || :OLD.EstPorteur || ' || ' || :OLD.EstPublieur || ' || ' || :OLD.EstSoutien |', ':NEW.IdJeu || ' || ' || :NEW.IdCompagnie || ' || ' || :NEW.EstDeveloppeur || ' || ' || :NEW.EstPorteur || ' || ' || :NEW.EstPublieur || ' || ' || :NEW.EstSoutien |', 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEJEU_DELETE
AFTER DELETE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdCompagnie || ' || ' || :OLD.EstDeveloppeur || ' || ' || :OLD.EstPorteur || ' || ' || :OLD.EstPublieur || ' || ' || :OLD.EstSoutien |', NULL, 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITEJEU_INSERT
AFTER INSERT ON MODALITEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdModalite |', 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITEJEU_UPDATE
AFTER UPDATE ON MODALITEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdModalite |', ':NEW.IdJeu || ' || ' || :NEW.IdModalite |', 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MODALITEJEU_DELETE
AFTER DELETE ON MODALITEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdModalite |', NULL, 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENREJEU_INSERT
AFTER INSERT ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdGenre |', 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENREJEU_UPDATE
AFTER UPDATE ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdGenre |', ':NEW.IdJeu || ' || ' || :NEW.IdGenre |', 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_GENREJEU_DELETE
AFTER DELETE ON GENREJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdGenre |', NULL, 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIFJEU_INSERT
AFTER INSERT ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdTitreAlternatif || ' || ' || :NEW.LibelleTitreAlternatif |', 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIFJEU_UPDATE
AFTER UPDATE ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdTitreAlternatif || ' || ' || :OLD.LibelleTitreAlternatif |', ':NEW.IdJeu || ' || ' || :NEW.IdTitreAlternatif || ' || ' || :NEW.LibelleTitreAlternatif |', 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_TITREALTERNATIFJEU_DELETE
AFTER DELETE ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdTitreAlternatif || ' || ' || :OLD.LibelleTitreAlternatif |', NULL, 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_SIMILARITE_INSERT
AFTER INSERT ON SIMILARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdJeuSimilaire |', 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_SIMILARITE_UPDATE
AFTER UPDATE ON SIMILARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdJeuSimilaire |', ':NEW.IdJeu || ' || ' || :NEW.IdJeuSimilaire |', 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_SIMILARITE_DELETE
AFTER DELETE ON SIMILARITE
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdJeuSimilaire |', NULL, 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLEJEU_INSERT
AFTER INSERT ON MOTCLEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdMotCle |', 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLEJEU_UPDATE
AFTER UPDATE ON MOTCLEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdMotCle |', ':NEW.IdJeu || ' || ' || :NEW.IdMotCle |', 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTCLEJEU_DELETE
AFTER DELETE ON MOTCLEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdMotCle |', NULL, 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEMEJEU_INSERT
AFTER INSERT ON THEMEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdTheme |', 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEMEJEU_UPDATE
AFTER UPDATE ON THEMEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdTheme |', ':NEW.IdJeu || ' || ' || :NEW.IdTheme |', 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_THEMEJEU_DELETE
AFTER DELETE ON THEMEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdTheme |', NULL, 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_INSERT
AFTER INSERT ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdClassification |', 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_UPDATE
AFTER UPDATE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdClassification |', ':NEW.IdJeu || ' || ' || :NEW.IdClassification |', 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_CLASSIFICATIONJEU_DELETE
AFTER DELETE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdClassification |', NULL, 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEURJEU_INSERT
AFTER INSERT ON MOTEURJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdMoteur |', 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEURJEU_UPDATE
AFTER UPDATE ON MOTEURJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdMoteur |', ':NEW.IdJeu || ' || ' || :NEW.IdMoteur |', 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_MOTEURJEU_DELETE
AFTER DELETE ON MOTEURJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdMoteur |', NULL, 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_INSERT
AFTER INSERT ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdCompagnie, NULL, NULL, ':NEW.IdCompagnie || ' || ' || :NEW.IdMoteur |', 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_UPDATE
AFTER UPDATE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, ':OLD.IdCompagnie || ' || ' || :OLD.IdMoteur |', ':NEW.IdCompagnie || ' || ' || :NEW.IdMoteur |', 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_COMPAGNIEMOTEUR_DELETE
AFTER DELETE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdCompagnie, NULL, ':OLD.IdCompagnie || ' || ' || :OLD.IdMoteur |', NULL, 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORMEMOTEUR_INSERT
AFTER INSERT ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdMoteur, NULL, NULL, ':NEW.IdMoteur || ' || ' || :NEW.IdPlateforme |', 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORMEMOTEUR_UPDATE
AFTER UPDATE ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, ':OLD.IdMoteur || ' || ' || :OLD.IdPlateforme |', ':NEW.IdMoteur || ' || ' || :NEW.IdPlateforme |', 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_PLATEFORMEMOTEUR_DELETE
AFTER DELETE ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdMoteur, NULL, ':OLD.IdMoteur || ' || ' || :OLD.IdPlateforme |', NULL, 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_INSERT
AFTER INSERT ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdFranchise |', 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_UPDATE
AFTER UPDATE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdFranchise |', ':NEW.IdJeu || ' || ' || :NEW.IdFranchise |', 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_FRANCHISEJEU_DELETE
AFTER DELETE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdFranchise |', NULL, 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_LOCALISATIONJEU_INSERT
AFTER INSERT ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'INSERT', SYSTIMESTAMP, :NEW.IdJeu, NULL, NULL, ':NEW.IdJeu || ' || ' || :NEW.IdRegion || ' || ' || :NEW.TitreLocalise |', 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_LOCALISATIONJEU_UPDATE
AFTER UPDATE ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'UPDATE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdRegion || ' || ' || :OLD.TitreLocalise |', ':NEW.IdJeu || ' || ' || :NEW.IdRegion || ' || ' || :NEW.TitreLocalise |', 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER declencheur_LOCALISATIONJEU_DELETE
AFTER DELETE ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)
  VALUES(user, 'DELETE', SYSTIMESTAMP, :OLD.IdJeu, NULL, ':OLD.IdJeu || ' || ' || :OLD.IdRegion || ' || ' || :OLD.TitreLocalise |', NULL, 'LOCALISATIONJEU');
END;
/

{"jeux":[{"IdJeu":2708,"TitreJeu":"Mario & Sonic at the London 2012 Olympic Games"},{"IdJeu":5400,"TitreJeu":"Lords of Thunder"},{"IdJeu":18520,"TitreJeu":"Mystery Fun House"}],"sorties":[{"IdDateSortie":352639,"IdJeu":5400,"IdPlateforme":150,"DateSortie":"1993-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":null},{"IdDateSortie":249378,"IdJeu":5400,"IdPlateforme":41,"DateSortie":"2017-11-09T00:00:00","RegionSortie":"north_america","StatutSortie":null},{"IdDateSortie":551453,"IdJeu":18520,"IdPlateforme":126,"DateSortie":"1979-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":140832,"IdJeu":5400,"IdPlateforme":5,"DateSortie":"2008-02-08T00:00:00","RegionSortie":"europe","StatutSortie":null},{"IdDateSortie":551454,"IdJeu":18520,"IdPlateforme":151,"DateSortie":"1983-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":551450,"IdJeu":18520,"IdPlateforme":125,"DateSortie":"1985-05-01T00:00:00","RegionSortie":"japan","StatutSortie":"Full Release"},{"IdDateSortie":352560,"IdJeu":5400,"IdPlateforme":78,"DateSortie":"1995-06-01T00:00:00","RegionSortie":"europe","StatutSortie":null},{"IdDateSortie":140833,"IdJeu":5400,"IdPlateforme":5,"DateSortie":"2008-06-10T00:00:00","RegionSortie":"japan","StatutSortie":null},{"IdDateSortie":551451,"IdJeu":18520,"IdPlateforme":77,"DateSortie":"1985-06-01T00:00:00","RegionSortie":"japan","StatutSortie":"Full Release"},{"IdDateSortie":379848,"IdJeu":5400,"IdPlateforme":5,"DateSortie":"2008-02-08T00:00:00","RegionSortie":"australia","StatutSortie":null},{"IdDateSortie":551444,"IdJeu":18520,"IdPlateforme":75,"DateSortie":"1980-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":619365,"IdJeu":2708,"IdPlateforme":5,"DateSortie":"2011-12-08T00:00:00","RegionSortie":"japan","StatutSortie":"Full Release"},{"IdDateSortie":551443,"IdJeu":18520,"IdPlateforme":134,"DateSortie":"1984-12-31T00:00:00","RegionSortie":"europe","StatutSortie":"Full Release"},{"IdDateSortie":619366,"IdJeu":2708,"IdPlateforme":5,"DateSortie":"2011-11-17T00:00:00","RegionSortie":"australia","StatutSortie":"Full Release"},{"IdDateSortie":551445,"IdJeu":18520,"IdPlateforme":65,"DateSortie":"1981-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":551446,"IdJeu":18520,"IdPlateforme":69,"DateSortie":"1986-12-31T00:00:00","RegionSortie":"europe","StatutSortie":"Full Release"},{"IdDateSortie":551452,"IdJeu":18520,"IdPlateforme":129,"DateSortie":"1981-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":551448,"IdJeu":18520,"IdPlateforme":153,"DateSortie":"1984-12-31T00:00:00","RegionSortie":"europe","StatutSortie":"Full Release"},{"IdDateSortie":619364,"IdJeu":2708,"IdPlateforme":5,"DateSortie":"2011-11-15T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":352557,"IdJeu":5400,"IdPlateforme":78,"DateSortie":"1995-03-28T00:00:00","RegionSortie":"north_america","StatutSortie":null},{"IdDateSortie":140831,"IdJeu":5400,"IdPlateforme":5,"DateSortie":"2008-02-11T00:00:00","RegionSortie":"north_america","StatutSortie":null},{"IdDateSortie":352559,"IdJeu":5400,"IdPlateforme":150,"DateSortie":"1993-04-23T00:00:00","RegionSortie":"japan","StatutSortie":null},{"IdDateSortie":619367,"IdJeu":2708,"IdPlateforme":5,"DateSortie":null,"RegionSortie":"brazil","StatutSortie":"Full Release"},{"IdDateSortie":551447,"IdJeu":18520,"IdPlateforme":15,"DateSortie":"1983-12-31T00:00:00","RegionSortie":"north_america","StatutSortie":"Full Release"},{"IdDateSortie":619363,"IdJeu":2708,"IdPlateforme":5,"DateSortie":"2011-11-18T00:00:00","RegionSortie":"europe","StatutSortie":"Full Release"},{"IdDateSortie":551449,"IdJeu":18520,"IdPlateforme":152,"DateSortie":"1985-12-31T00:00:00","RegionSortie":"japan","StatutSortie":"Full Release"}],"compagnies":[{"IdCompagnie":70,"NomCompagnie":"Nintendo"},{"IdCompagnie":112,"NomCompagnie":"Sega"},{"IdCompagnie":161,"NomCompagnie":"Konami Digital Entertainment"},{"IdCompagnie":229,"NomCompagnie":"Sega of America"},{"IdCompagnie":864,"NomCompagnie":"Hudson Soft"},{"IdCompagnie":1081,"NomCompagnie":"Adventure International"},{"IdCompagnie":1272,"NomCompagnie":"Sega Sports R&D"},{"IdCompagnie":2233,"NomCompagnie":"Red Entertainment"},{"IdCompagnie":4024,"NomCompagnie":"StarCraft"},{"IdCompagnie":9484,"NomCompagnie":"Texas Instruments Incorporated"},{"IdCompagnie":22931,"NomCompagnie":"Hudson Entertainment"},{"IdCompagnie":24193,"NomCompagnie":"Eleven"}],"compagnies_jeux":[{"IdJeu":2708,"IdCompagnie":70,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":2708,"IdCompagnie":112,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":2708,"IdCompagnie":1272,"EstDeveloppeur":1,"EstPorteur":0,"EstPublieur":0,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":161,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":229,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":864,"EstDeveloppeur":1,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":2233,"EstDeveloppeur":1,"EstPorteur":0,"EstPublieur":0,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":22931,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":5400,"IdCompagnie":24193,"EstDeveloppeur":1,"EstPorteur":0,"EstPublieur":0,"EstSoutien":0},{"IdJeu":18520,"IdCompagnie":1081,"EstDeveloppeur":1,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":18520,"IdCompagnie":4024,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0},{"IdJeu":18520,"IdCompagnie":9484,"EstDeveloppeur":0,"EstPorteur":0,"EstPublieur":1,"EstSoutien":0}],"plateformes":[{"IdPlateforme":5,"NomPlateforme":"Wii"},{"IdPlateforme":15,"NomPlateforme":"Commodore C64/128/MAX"},{"IdPlateforme":41,"NomPlateforme":"Wii U"},{"IdPlateforme":65,"NomPlateforme":"Atari 8-bit"},{"IdPlateforme":69,"NomPlateforme":"BBC Microcomputer System"},{"IdPlateforme":75,"NomPlateforme":"Apple II"},{"IdPlateforme":77,"NomPlateforme":"Sharp X1"},{"IdPlateforme":78,"NomPlateforme":"Sega CD"},{"IdPlateforme":125,"NomPlateforme":"PC-8800 Series"},{"IdPlateforme":126,"NomPlateforme":"TRS-80"},{"IdPlateforme":129,"NomPlateforme":"Texas Instruments TI-99"},{"IdPlateforme":134,"NomPlateforme":"Acorn Electron"},{"IdPlateforme":150,"NomPlateforme":"Turbografx-16/PC Engine CD"},{"IdPlateforme":151,"NomPlateforme":"TRS-80 Color Computer"},{"IdPlateforme":152,"NomPlateforme":"FM-7"},{"IdPlateforme":153,"NomPlateforme":"Dragon 32/64"}]}
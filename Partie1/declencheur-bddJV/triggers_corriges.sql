-- Triggers pour log automatique

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_INSERT
AFTER INSERT ON CATEGORIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdCategorieJeu, NULL, '' || :NEW.IdCategorieJeu || '|' || :NEW.NomCategoriejeu || '', 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_UPDATE
AFTER UPDATE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdCategorieJeu, '' || :OLD.IdCategorieJeu || '|' || :OLD.NomCategoriejeu || '', '' || :NEW.IdCategorieJeu || '|' || :NEW.NomCategoriejeu || '', 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEJEU_DELETE
AFTER DELETE ON CATEGORIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdCategorieJeu, '' || :OLD.IdCategorieJeu || '|' || :OLD.NomCategoriejeu || '', NULL, 'CATEGORIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_INSERT
AFTER INSERT ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdCategoriePlateforme, NULL, '' || :NEW.IdCategoriePlateforme || '|' || :NEW.NomCategoriePlateforme || '', 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_UPDATE
AFTER UPDATE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdCategoriePlateforme, '' || :OLD.IdCategoriePlateforme || '|' || :OLD.NomCategoriePlateforme || '', '' || :NEW.IdCategoriePlateforme || '|' || :NEW.NomCategoriePlateforme || '', 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CATEGORIEPLATEFORME_DELETE
AFTER DELETE ON CATEGORIEPLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdCategoriePlateforme, '' || :OLD.IdCategoriePlateforme || '|' || :OLD.NomCategoriePlateforme || '', NULL, 'CATEGORIEPLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_INSERT
AFTER INSERT ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdClassification, NULL, '' || :NEW.IdClassification || '|' || :NEW.OrganismeClassification || '|' || :NEW.Classification || '|' || :NEW.SynopsisClassification || '', 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_UPDATE
AFTER UPDATE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdClassification, '' || :OLD.IdClassification || '|' || :OLD.OrganismeClassification || '|' || :OLD.Classification || '|' || :OLD.SynopsisClassification || '', '' || :NEW.IdClassification || '|' || :NEW.OrganismeClassification || '|' || :NEW.Classification || '|' || :NEW.SynopsisClassification || '', 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONAGE_DELETE
AFTER DELETE ON CLASSIFICATIONAGE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdClassification, '' || :OLD.IdClassification || '|' || :OLD.OrganismeClassification || '|' || :OLD.Classification || '|' || :OLD.SynopsisClassification || '', NULL, 'CLASSIFICATIONAGE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_INSERT
AFTER INSERT ON COMPAGNIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdCompagnie, NULL, '' || :NEW.IdCompagnie || '|' || :NEW.NomCompagnie || '|' || :NEW.DescrCompagnie || '|' || :NEW.PaysCompagnie || '|' || :NEW.DateFondationCompagnie || '|' || :NEW.DateMAJCompagnie || '|' || :NEW.CompagnieParent || '', 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_UPDATE
AFTER UPDATE ON COMPAGNIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdCompagnie, '' || :OLD.IdCompagnie || '|' || :OLD.NomCompagnie || '|' || :OLD.DescrCompagnie || '|' || :OLD.PaysCompagnie || '|' || :OLD.DateFondationCompagnie || '|' || :OLD.DateMAJCompagnie || '|' || :OLD.CompagnieParent || '', '' || :NEW.IdCompagnie || '|' || :NEW.NomCompagnie || '|' || :NEW.DescrCompagnie || '|' || :NEW.PaysCompagnie || '|' || :NEW.DateFondationCompagnie || '|' || :NEW.DateMAJCompagnie || '|' || :NEW.CompagnieParent || '', 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIE_DELETE
AFTER DELETE ON COMPAGNIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdCompagnie, '' || :OLD.IdCompagnie || '|' || :OLD.NomCompagnie || '|' || :OLD.DescrCompagnie || '|' || :OLD.PaysCompagnie || '|' || :OLD.DateFondationCompagnie || '|' || :OLD.DateMAJCompagnie || '|' || :OLD.CompagnieParent || '', NULL, 'COMPAGNIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_INSERT
AFTER INSERT ON DATESORTIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdDateSortie, NULL, '' || :NEW.IdDateSortie || '|' || :NEW.DateSortie || '|' || :NEW.RegionSortie || '|' || :NEW.StatutSortie || '|' || :NEW.DateMAJDateSortie || '', 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_UPDATE
AFTER UPDATE ON DATESORTIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdDateSortie, '' || :OLD.IdDateSortie || '|' || :OLD.DateSortie || '|' || :OLD.RegionSortie || '|' || :OLD.StatutSortie || '|' || :OLD.DateMAJDateSortie || '', '' || :NEW.IdDateSortie || '|' || :NEW.DateSortie || '|' || :NEW.RegionSortie || '|' || :NEW.StatutSortie || '|' || :NEW.DateMAJDateSortie || '', 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_DATESORTIE_DELETE
AFTER DELETE ON DATESORTIE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdDateSortie, '' || :OLD.IdDateSortie || '|' || :OLD.DateSortie || '|' || :OLD.RegionSortie || '|' || :OLD.StatutSortie || '|' || :OLD.DateMAJDateSortie || '', NULL, 'DATESORTIE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_INSERT
AFTER INSERT ON FRANCHISE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdFranchise, NULL, '' || :NEW.IdFranchise || '|' || :NEW.NomFranchise || '', 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_UPDATE
AFTER UPDATE ON FRANCHISE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdFranchise, '' || :OLD.IdFranchise || '|' || :OLD.NomFranchise || '', '' || :NEW.IdFranchise || '|' || :NEW.NomFranchise || '', 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISE_DELETE
AFTER DELETE ON FRANCHISE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdFranchise, '' || :OLD.IdFranchise || '|' || :OLD.NomFranchise || '', NULL, 'FRANCHISE');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_INSERT
AFTER INSERT ON JEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.TitreJeu || '|' || :NEW.TitreVersionJeu || '|' || :NEW.HistoireJeu || '|' || :NEW.ResumeJeu || '|' || :NEW.ScoreAgregeJeu || '|' || :NEW.NombreNotesAgregeesJeu || '|' || :NEW.ScoreIGDB || '|' || :NEW.NombreNotesIGDBJeu || '|' || :NEW.ScoreJeu || '|' || :NEW.NombreNotesJeu || '|' || :NEW.TempsJeu_Normal || '|' || :NEW.TempsJeu_Rapide || '|' || :NEW.TempsJeu_Complet || '|' || :NEW.NombreTempsJeu || '|' || :NEW.StatutJeu || '|' || :NEW.DateMAJJeu || '|' || :NEW.VersionParent || '|' || :NEW.IdJeuParent || '|' || :NEW.FranchisePrincipaleJeu || '|' || :NEW.CategorieJeu || '', 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_UPDATE
AFTER UPDATE ON JEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.TitreJeu || '|' || :OLD.TitreVersionJeu || '|' || :OLD.HistoireJeu || '|' || :OLD.ResumeJeu || '|' || :OLD.ScoreAgregeJeu || '|' || :OLD.NombreNotesAgregeesJeu || '|' || :OLD.ScoreIGDB || '|' || :OLD.NombreNotesIGDBJeu || '|' || :OLD.ScoreJeu || '|' || :OLD.NombreNotesJeu || '|' || :OLD.TempsJeu_Normal || '|' || :OLD.TempsJeu_Rapide || '|' || :OLD.TempsJeu_Complet || '|' || :OLD.NombreTempsJeu || '|' || :OLD.StatutJeu || '|' || :OLD.DateMAJJeu || '|' || :OLD.VersionParent || '|' || :OLD.IdJeuParent || '|' || :OLD.FranchisePrincipaleJeu || '|' || :OLD.CategorieJeu || '', '' || :NEW.IdJeu || '|' || :NEW.TitreJeu || '|' || :NEW.TitreVersionJeu || '|' || :NEW.HistoireJeu || '|' || :NEW.ResumeJeu || '|' || :NEW.ScoreAgregeJeu || '|' || :NEW.NombreNotesAgregeesJeu || '|' || :NEW.ScoreIGDB || '|' || :NEW.NombreNotesIGDBJeu || '|' || :NEW.ScoreJeu || '|' || :NEW.NombreNotesJeu || '|' || :NEW.TempsJeu_Normal || '|' || :NEW.TempsJeu_Rapide || '|' || :NEW.TempsJeu_Complet || '|' || :NEW.NombreTempsJeu || '|' || :NEW.StatutJeu || '|' || :NEW.DateMAJJeu || '|' || :NEW.VersionParent || '|' || :NEW.IdJeuParent || '|' || :NEW.FranchisePrincipaleJeu || '|' || :NEW.CategorieJeu || '', 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_JEU_DELETE
AFTER DELETE ON JEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.TitreJeu || '|' || :OLD.TitreVersionJeu || '|' || :OLD.HistoireJeu || '|' || :OLD.ResumeJeu || '|' || :OLD.ScoreAgregeJeu || '|' || :OLD.NombreNotesAgregeesJeu || '|' || :OLD.ScoreIGDB || '|' || :OLD.NombreNotesIGDBJeu || '|' || :OLD.ScoreJeu || '|' || :OLD.NombreNotesJeu || '|' || :OLD.TempsJeu_Normal || '|' || :OLD.TempsJeu_Rapide || '|' || :OLD.TempsJeu_Complet || '|' || :OLD.NombreTempsJeu || '|' || :OLD.StatutJeu || '|' || :OLD.DateMAJJeu || '|' || :OLD.VersionParent || '|' || :OLD.IdJeuParent || '|' || :OLD.FranchisePrincipaleJeu || '|' || :OLD.CategorieJeu || '', NULL, 'JEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_INSERT
AFTER INSERT ON GENRE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdGenre, NULL, '' || :NEW.IdGenre || '|' || :NEW.NomGenre || '', 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_UPDATE
AFTER UPDATE ON GENRE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdGenre, '' || :OLD.IdGenre || '|' || :OLD.NomGenre || '', '' || :NEW.IdGenre || '|' || :NEW.NomGenre || '', 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_GENRE_DELETE
AFTER DELETE ON GENRE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdGenre, '' || :OLD.IdGenre || '|' || :OLD.NomGenre || '', NULL, 'GENRE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_INSERT
AFTER INSERT ON MODALITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdModalite, NULL, '' || :NEW.IdModalite || '|' || :NEW.NomModalite || '', 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_UPDATE
AFTER UPDATE ON MODALITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdModalite, '' || :OLD.IdModalite || '|' || :OLD.NomModalite || '', '' || :NEW.IdModalite || '|' || :NEW.NomModalite || '', 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITE_DELETE
AFTER DELETE ON MODALITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdModalite, '' || :OLD.IdModalite || '|' || :OLD.NomModalite || '', NULL, 'MODALITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_INSERT
AFTER INSERT ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdModeMultiJoueur, NULL, '' || :NEW.IdModeMultiJoueur || '|' || :NEW.DropIn || '|' || :NEW.ModeCoopCampagne || '|' || :NEW.ModeCoopLAN || '|' || :NEW.ModeCoopOffline || '|' || :NEW.ModeCoopOnline || '|' || :NEW.ModeSplitScreen || '|' || :NEW.NbJoueursMaxCoopOffline || '|' || :NEW.NbJoueursMaxOffline || '|' || :NEW.NbJoueursMaxCoopOnline || '|' || :NEW.NbJoueursMaxOnline || '|' || :NEW.IdJeu || '|' || :NEW.IdPlateforme || '', 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_UPDATE
AFTER UPDATE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdModeMultiJoueur, '' || :OLD.IdModeMultiJoueur || '|' || :OLD.DropIn || '|' || :OLD.ModeCoopCampagne || '|' || :OLD.ModeCoopLAN || '|' || :OLD.ModeCoopOffline || '|' || :OLD.ModeCoopOnline || '|' || :OLD.ModeSplitScreen || '|' || :OLD.NbJoueursMaxCoopOffline || '|' || :OLD.NbJoueursMaxOffline || '|' || :OLD.NbJoueursMaxCoopOnline || '|' || :OLD.NbJoueursMaxOnline || '|' || :OLD.IdJeu || '|' || :OLD.IdPlateforme || '', '' || :NEW.IdModeMultiJoueur || '|' || :NEW.DropIn || '|' || :NEW.ModeCoopCampagne || '|' || :NEW.ModeCoopLAN || '|' || :NEW.ModeCoopOffline || '|' || :NEW.ModeCoopOnline || '|' || :NEW.ModeSplitScreen || '|' || :NEW.NbJoueursMaxCoopOffline || '|' || :NEW.NbJoueursMaxOffline || '|' || :NEW.NbJoueursMaxCoopOnline || '|' || :NEW.NbJoueursMaxOnline || '|' || :NEW.IdJeu || '|' || :NEW.IdPlateforme || '', 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MODEMULTIJOUEUR_DELETE
AFTER DELETE ON MODEMULTIJOUEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdModeMultiJoueur, '' || :OLD.IdModeMultiJoueur || '|' || :OLD.DropIn || '|' || :OLD.ModeCoopCampagne || '|' || :OLD.ModeCoopLAN || '|' || :OLD.ModeCoopOffline || '|' || :OLD.ModeCoopOnline || '|' || :OLD.ModeSplitScreen || '|' || :OLD.NbJoueursMaxCoopOffline || '|' || :OLD.NbJoueursMaxOffline || '|' || :OLD.NbJoueursMaxCoopOnline || '|' || :OLD.NbJoueursMaxOnline || '|' || :OLD.IdJeu || '|' || :OLD.IdPlateforme || '', NULL, 'MODEMULTIJOUEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_INSERT
AFTER INSERT ON MOTCLE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdMotCle, NULL, '' || :NEW.IdMotCle || '|' || :NEW.NomMotCle || '', 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_UPDATE
AFTER UPDATE ON MOTCLE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdMotCle, '' || :OLD.IdMotCle || '|' || :OLD.NomMotCle || '', '' || :NEW.IdMotCle || '|' || :NEW.NomMotCle || '', 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLE_DELETE
AFTER DELETE ON MOTCLE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdMotCle, '' || :OLD.IdMotCle || '|' || :OLD.NomMotCle || '', NULL, 'MOTCLE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_INSERT
AFTER INSERT ON MOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdMoteur, NULL, '' || :NEW.IdMoteur || '|' || :NEW.NomMoteur || '|' || :NEW.DescrMoteur || '|' || :NEW.DateMAJMoteur || '', 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_UPDATE
AFTER UPDATE ON MOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdMoteur, '' || :OLD.IdMoteur || '|' || :OLD.NomMoteur || '|' || :OLD.DescrMoteur || '|' || :OLD.DateMAJMoteur || '', '' || :NEW.IdMoteur || '|' || :NEW.NomMoteur || '|' || :NEW.DescrMoteur || '|' || :NEW.DateMAJMoteur || '', 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEUR_DELETE
AFTER DELETE ON MOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdMoteur, '' || :OLD.IdMoteur || '|' || :OLD.NomMoteur || '|' || :OLD.DescrMoteur || '|' || :OLD.DateMAJMoteur || '', NULL, 'MOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_INSERT
AFTER INSERT ON PLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdPlateforme, NULL, '' || :NEW.IdPlateforme || '|' || :NEW.NomPlateforme || '|' || :NEW.AbbreviationPlateforme || '|' || :NEW.NomAlternatifPlateforme || '|' || :NEW.DescriptifPlateforme || '|' || :NEW.GenerationPlateforme || '|' || :NEW.IdCategoriePlateforme || '', 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_UPDATE
AFTER UPDATE ON PLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdPlateforme, '' || :OLD.IdPlateforme || '|' || :OLD.NomPlateforme || '|' || :OLD.AbbreviationPlateforme || '|' || :OLD.NomAlternatifPlateforme || '|' || :OLD.DescriptifPlateforme || '|' || :OLD.GenerationPlateforme || '|' || :OLD.IdCategoriePlateforme || '', '' || :NEW.IdPlateforme || '|' || :NEW.NomPlateforme || '|' || :NEW.AbbreviationPlateforme || '|' || :NEW.NomAlternatifPlateforme || '|' || :NEW.DescriptifPlateforme || '|' || :NEW.GenerationPlateforme || '|' || :NEW.IdCategoriePlateforme || '', 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORME_DELETE
AFTER DELETE ON PLATEFORME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdPlateforme, '' || :OLD.IdPlateforme || '|' || :OLD.NomPlateforme || '|' || :OLD.AbbreviationPlateforme || '|' || :OLD.NomAlternatifPlateforme || '|' || :OLD.DescriptifPlateforme || '|' || :OLD.GenerationPlateforme || '|' || :OLD.IdCategoriePlateforme || '', NULL, 'PLATEFORME');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_INSERT
AFTER INSERT ON POPULARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.MesurePopularite, NULL, '' || :NEW.MesurePopularite || '|' || :NEW.ValeurPopularite || '', 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_UPDATE
AFTER UPDATE ON POPULARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.MesurePopularite, '' || :OLD.MesurePopularite || '|' || :OLD.ValeurPopularite || '', '' || :NEW.MesurePopularite || '|' || :NEW.ValeurPopularite || '', 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_POPULARITE_DELETE
AFTER DELETE ON POPULARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.MesurePopularite, '' || :OLD.MesurePopularite || '|' || :OLD.ValeurPopularite || '', NULL, 'POPULARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_INSERT
AFTER INSERT ON REGION
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdRegion, NULL, '' || :NEW.IdRegion || '|' || :NEW.NomRegion || '', 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_UPDATE
AFTER UPDATE ON REGION
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdRegion, '' || :OLD.IdRegion || '|' || :OLD.NomRegion || '', '' || :NEW.IdRegion || '|' || :NEW.NomRegion || '', 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_REGION_DELETE
AFTER DELETE ON REGION
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdRegion, '' || :OLD.IdRegion || '|' || :OLD.NomRegion || '', NULL, 'REGION');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_INSERT
AFTER INSERT ON THEME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdTheme, NULL, '' || :NEW.IdTheme || '|' || :NEW.NomTheme || '', 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_UPDATE
AFTER UPDATE ON THEME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdTheme, '' || :OLD.IdTheme || '|' || :OLD.NomTheme || '', '' || :NEW.IdTheme || '|' || :NEW.NomTheme || '', 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_THEME_DELETE
AFTER DELETE ON THEME
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdTheme, '' || :OLD.IdTheme || '|' || :OLD.NomTheme || '', NULL, 'THEME');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_INSERT
AFTER INSERT ON TITREALTERNATIF
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdTitreAlternatif, NULL, '' || :NEW.IdTitreAlternatif || '|' || :NEW.LibelleTitreAlternatif || '', 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_UPDATE
AFTER UPDATE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdTitreAlternatif, '' || :OLD.IdTitreAlternatif || '|' || :OLD.LibelleTitreAlternatif || '', '' || :NEW.IdTitreAlternatif || '|' || :NEW.LibelleTitreAlternatif || '', 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIF_DELETE
AFTER DELETE ON TITREALTERNATIF
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdTitreAlternatif, '' || :OLD.IdTitreAlternatif || '|' || :OLD.LibelleTitreAlternatif || '', NULL, 'TITREALTERNATIF');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_INSERT
AFTER INSERT ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdCompagnie || '|' || :NEW.EstDeveloppeur || '|' || :NEW.EstPorteur || '|' || :NEW.EstPublieur || '|' || :NEW.EstSoutien || '', 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_UPDATE
AFTER UPDATE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdCompagnie || '|' || :OLD.EstDeveloppeur || '|' || :OLD.EstPorteur || '|' || :OLD.EstPublieur || '|' || :OLD.EstSoutien || '', '' || :NEW.IdJeu || '|' || :NEW.IdCompagnie || '|' || :NEW.EstDeveloppeur || '|' || :NEW.EstPorteur || '|' || :NEW.EstPublieur || '|' || :NEW.EstSoutien || '', 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEJEU_DELETE
AFTER DELETE ON COMPAGNIEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdCompagnie || '|' || :OLD.EstDeveloppeur || '|' || :OLD.EstPorteur || '|' || :OLD.EstPublieur || '|' || :OLD.EstSoutien || '', NULL, 'COMPAGNIEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_INSERT
AFTER INSERT ON MODALITEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdModalite || '', 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_UPDATE
AFTER UPDATE ON MODALITEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdModalite || '', '' || :NEW.IdJeu || '|' || :NEW.IdModalite || '', 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MODALITEJEU_DELETE
AFTER DELETE ON MODALITEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdModalite || '', NULL, 'MODALITEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_INSERT
AFTER INSERT ON GENREJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdGenre || '', 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_UPDATE
AFTER UPDATE ON GENREJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdGenre || '', '' || :NEW.IdJeu || '|' || :NEW.IdGenre || '', 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_GENREJEU_DELETE
AFTER DELETE ON GENREJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdGenre || '', NULL, 'GENREJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_INSERT
AFTER INSERT ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdTitreAlternatif || '|' || :NEW.LibelleTitreAlternatif || '', 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_UPDATE
AFTER UPDATE ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdTitreAlternatif || '|' || :OLD.LibelleTitreAlternatif || '', '' || :NEW.IdJeu || '|' || :NEW.IdTitreAlternatif || '|' || :NEW.LibelleTitreAlternatif || '', 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_TITREALTERNATIFJEU_DELETE
AFTER DELETE ON TITREALTERNATIFJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdTitreAlternatif || '|' || :OLD.LibelleTitreAlternatif || '', NULL, 'TITREALTERNATIFJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_INSERT
AFTER INSERT ON SIMILARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdJeuSimilaire || '', 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_UPDATE
AFTER UPDATE ON SIMILARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdJeuSimilaire || '', '' || :NEW.IdJeu || '|' || :NEW.IdJeuSimilaire || '', 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_SIMILARITE_DELETE
AFTER DELETE ON SIMILARITE
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdJeuSimilaire || '', NULL, 'SIMILARITE');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_INSERT
AFTER INSERT ON MOTCLEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdMotCle || '', 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_UPDATE
AFTER UPDATE ON MOTCLEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdMotCle || '', '' || :NEW.IdJeu || '|' || :NEW.IdMotCle || '', 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTCLEJEU_DELETE
AFTER DELETE ON MOTCLEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdMotCle || '', NULL, 'MOTCLEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_INSERT
AFTER INSERT ON THEMEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdTheme || '', 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_UPDATE
AFTER UPDATE ON THEMEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdTheme || '', '' || :NEW.IdJeu || '|' || :NEW.IdTheme || '', 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_THEMEJEU_DELETE
AFTER DELETE ON THEMEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdTheme || '', NULL, 'THEMEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_INSERT
AFTER INSERT ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdClassification || '', 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_UPDATE
AFTER UPDATE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdClassification || '', '' || :NEW.IdJeu || '|' || :NEW.IdClassification || '', 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_CLASSIFICATIONJEU_DELETE
AFTER DELETE ON CLASSIFICATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdClassification || '', NULL, 'CLASSIFICATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_INSERT
AFTER INSERT ON MOTEURJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdMoteur || '', 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_UPDATE
AFTER UPDATE ON MOTEURJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdMoteur || '', '' || :NEW.IdJeu || '|' || :NEW.IdMoteur || '', 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_MOTEURJEU_DELETE
AFTER DELETE ON MOTEURJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdMoteur || '', NULL, 'MOTEURJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_INSERT
AFTER INSERT ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdCompagnie, NULL, '' || :NEW.IdCompagnie || '|' || :NEW.IdMoteur || '', 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_UPDATE
AFTER UPDATE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdCompagnie, '' || :OLD.IdCompagnie || '|' || :OLD.IdMoteur || '', '' || :NEW.IdCompagnie || '|' || :NEW.IdMoteur || '', 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_COMPAGNIEMOTEUR_DELETE
AFTER DELETE ON COMPAGNIEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdCompagnie, '' || :OLD.IdCompagnie || '|' || :OLD.IdMoteur || '', NULL, 'COMPAGNIEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_INSERT
AFTER INSERT ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdMoteur, NULL, '' || :NEW.IdMoteur || '|' || :NEW.IdPlateforme || '', 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_UPDATE
AFTER UPDATE ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdMoteur, '' || :OLD.IdMoteur || '|' || :OLD.IdPlateforme || '', '' || :NEW.IdMoteur || '|' || :NEW.IdPlateforme || '', 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_PLATEFORMEMOTEUR_DELETE
AFTER DELETE ON PLATEFORMEMOTEUR
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdMoteur, '' || :OLD.IdMoteur || '|' || :OLD.IdPlateforme || '', NULL, 'PLATEFORMEMOTEUR');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_INSERT
AFTER INSERT ON FRANCHISEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdFranchise || '', 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_UPDATE
AFTER UPDATE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdFranchise || '', '' || :NEW.IdJeu || '|' || :NEW.IdFranchise || '', 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_FRANCHISEJEU_DELETE
AFTER DELETE ON FRANCHISEJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdFranchise || '', NULL, 'FRANCHISEJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_INSERT
AFTER INSERT ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'INSERT', :NEW.IdJeu, NULL, '' || :NEW.IdJeu || '|' || :NEW.IdRegion || '|' || :NEW.TitreLocalise || '', 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_UPDATE
AFTER UPDATE ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'UPDATE', :NEW.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdRegion || '|' || :OLD.TitreLocalise || '', '' || :NEW.IdJeu || '|' || :NEW.IdRegion || '|' || :NEW.TitreLocalise || '', 'LOCALISATIONJEU');
END;
/

CREATE OR REPLACE TRIGGER trig_LOCALISATIONJEU_DELETE
AFTER DELETE ON LOCALISATIONJEU
FOR EACH ROW
BEGIN
    INSERT INTO LOG(idAuteur, action, idEnregistrement, valeurAvant, valeurApres, nomTable)
    VALUES(USER, 'DELETE', :OLD.IdJeu, '' || :OLD.IdJeu || '|' || :OLD.IdRegion || '|' || :OLD.TitreLocalise || '', NULL, 'LOCALISATIONJEU');
END;
/


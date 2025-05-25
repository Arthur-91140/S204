#include <iostream>
#include <fstream>
#include <vector>
#include <string>

struct Table {
    std::string name;
    std::string idColumn;
    std::vector<std::string> columns;
};

void writeTrigger(std::ofstream& file, const Table& table, const std::string& action) {
    std::string triggerName = "trig_" + table.name + "_" + action;
    std::string timing = "AFTER " + action;
    
    file << "CREATE OR REPLACE TRIGGER " << triggerName << "\n";
    file << timing << " ON " << table.name << "\n";
    file << "FOR EACH ROW\n";
    
    if (action == "INSERT") {
        file << "DECLARE\n";
        file << "    ligne_apres VARCHAR2(4000);\n";
        file << "BEGIN\n";
        // Construire la valeur après avec gestion des NULL
        file << "    ligne_apres := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << "NVL(TO_CHAR(:NEW." << table.columns[i] << "), 'NULL')";
        }
        file << ";\n";
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "    VALUES(USER, '" << action << "', SYSTIMESTAMP, NULL, ligne_apres);\n";
        file << "END;\n";
    }
    else if (action == "DELETE") {
        file << "DECLARE\n";
        file << "    ligne_avant VARCHAR2(4000);\n";
        file << "BEGIN\n";
        // Construire la valeur avant avec gestion des NULL
        file << "    ligne_avant := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << "NVL(TO_CHAR(:OLD." << table.columns[i] << "), 'NULL')";
        }
        file << ";\n";
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "    VALUES(USER, '" << action << "', SYSTIMESTAMP, ligne_avant, NULL);\n";
        file << "END;\n";
    }
    else if (action == "UPDATE") {
        file << "DECLARE\n";
        file << "    ligne_avant VARCHAR2(4000);\n";
        file << "    ligne_apres VARCHAR2(4000);\n";
        file << "    modifications_detectees BOOLEAN := FALSE;\n";
        file << "BEGIN\n";
        
        // Vérifier s'il y a vraiment des modifications
        file << "    -- Vérifier les modifications colonne par colonne\n";
        for (size_t i = 0; i < table.columns.size(); i++) {
            file << "    IF (NVL(:OLD." << table.columns[i] << ", 'NULL_VALUE') != NVL(:NEW." 
                 << table.columns[i] << ", 'NULL_VALUE')) THEN\n";
            file << "        modifications_detectees := TRUE;\n";
            file << "    END IF;\n";
        }
        
        file << "    \n";
        file << "    -- Seulement logger s'il y a des modifications réelles\n";
        file << "    IF modifications_detectees THEN\n";
        
        // Construire les valeurs avant et après avec gestion des NULL
        file << "        ligne_avant := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << "NVL(TO_CHAR(:OLD." << table.columns[i] << "), 'NULL')";
        }
        file << ";\n";
        file << "        ligne_apres := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << "NVL(TO_CHAR(:NEW." << table.columns[i] << "), 'NULL')";
        }
        file << ";\n";
        file << "        \n";
        file << "        INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "        VALUES(USER, '" << action << "', SYSTIMESTAMP, ligne_avant, ligne_apres);\n";
        file << "    END IF;\n";
        file << "END;\n";
    }
    
    file << "/\n\n";
}

int main() {
    std::ofstream file("triggers_corriges.sql");
    
    // Ajouter un header avec la création de la table LOG
    file << "-- Triggers générés automatiquement pour la BDD jeux vidéo\n";
    file << "-- Table LOG pour enregistrer les modifications\n\n";
    
    file << "-- Création de la table LOG si elle n'existe pas\n";
    file << "CREATE TABLE LOG (\n";
    file << "    idLog NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,\n";
    file << "    idAuteur VARCHAR2(128) NOT NULL,\n";
    file << "    action VARCHAR2(20) NOT NULL,\n";
    file << "    dateHeureAction TIMESTAMP NOT NULL,\n";
    file << "    ligneAvant VARCHAR2(4000),\n";
    file << "    ligneApres VARCHAR2(4000)\n";
    file << ");\n\n";
    
    file << "-- Pour vider la table LOG: DELETE FROM LOG; ou TRUNCATE TABLE LOG;\n\n";

    std::vector<Table> tables = {
        {"CATEGORIEJEU", "IdCategorieJeu", {"IdCategorieJeu", "NomCategoriejeu"}},
        {"CATEGORIEPLATEFORME", "IdCategoriePlateforme", {"IdCategoriePlateforme", "NomCategoriePlateforme"}},
        {"CLASSIFICATIONAGE", "IdClassification", {"IdClassification", "OrganismeClassification", "Classification", "SynopsisClassification"}},
        {"COMPAGNIE", "IdCompagnie", {"IdCompagnie", "NomCompagnie", "DescrCompagnie", "PaysCompagnie", "DateFondationCompagnie", "DateMAJCompagnie", "CompagnieParent"}},
        {"DATESORTIE", "IdDateSortie", {"IdDateSortie", "DateSortie", "RegionSortie", "StatutSortie", "DateMAJDateSortie"}},
        {"FRANCHISE", "IdFranchise", {"IdFranchise", "NomFranchise"}},
        {"JEU", "IdJeu", {"IdJeu", "TitreJeu", "TitreVersionJeu", "HistoireJeu", "ResumeJeu", "ScoreAgregeJeu", "NombreNotesAgregeesJeu", "ScoreIGDB", "NombreNotesIGDBJeu", "ScoreJeu", "NombreNotesJeu", "TempsJeu_Normal", "TempsJeu_Rapide", "TempsJeu_Complet", "NombreTempsJeu", "StatutJeu", "DateMAJJeu", "VersionParent", "IdJeuParent", "FranchisePrincipaleJeu", "CategorieJeu"}},
        {"GENRE", "IdGenre", {"IdGenre", "NomGenre"}},
        {"MODALITE", "IdModalite", {"IdModalite", "NomModalite"}},
        {"MODEMULTIJOUEUR", "IdModeMultiJoueur", {"IdModeMultiJoueur", "DropIn", "ModeCoopCampagne", "ModeCoopLAN", "ModeCoopOffline", "ModeCoopOnline", "ModeSplitScreen", "NbJoueursMaxCoopOffline", "NbJoueursMaxOffline", "NbJoueursMaxCoopOnline", "NbJoueursMaxOnline", "IdJeu", "IdPlateforme"}},
        {"MOTCLE", "IdMotCle", {"IdMotCle", "NomMotCle"}},
        {"MOTEUR", "IdMoteur", {"IdMoteur", "NomMoteur", "DescrMoteur", "DateMAJMoteur"}},
        {"PLATEFORME", "IdPlateforme", {"IdPlateforme", "NomPlateforme", "AbbreviationPlateforme", "NomAlternatifPlateforme", "DescriptifPlateforme", "GenerationPlateforme", "IdCategoriePlateforme"}},
        {"POPULARITE", "MesurePopularite", {"MesurePopularite", "ValeurPopularite"}},
        {"REGION", "IdRegion", {"IdRegion", "NomRegion"}},
        {"THEME", "IdTheme", {"IdTheme", "NomTheme"}},
        {"TITREALTERNATIF", "IdTitreAlternatif", {"IdTitreAlternatif", "LibelleTitreAlternatif"}},
        {"COMPAGNIEJEU", "IdJeu", {"IdJeu", "IdCompagnie", "EstDeveloppeur", "EstPorteur", "EstPublieur", "EstSoutien"}},
        {"MODALITEJEU", "IdJeu", {"IdJeu", "IdModalite"}},
        {"GENREJEU", "IdJeu", {"IdJeu", "IdGenre"}},
        {"TITREALTERNATIFJEU", "IdJeu", {"IdJeu", "IdTitreAlternatif", "LibelleTitreAlternatif"}},
        {"SIMILARITE", "IdJeu", {"IdJeu", "IdJeuSimilaire"}},
        {"MOTCLEJEU", "IdJeu", {"IdJeu", "IdMotCle"}},
        {"THEMEJEU", "IdJeu", {"IdJeu", "IdTheme"}},
        {"CLASSIFICATIONJEU", "IdJeu", {"IdJeu", "IdClassification"}},
        {"MOTEURJEU", "IdJeu", {"IdJeu", "IdMoteur"}},
        {"COMPAGNIEMOTEUR", "IdCompagnie", {"IdCompagnie", "IdMoteur"}},
        {"PLATEFORMEMOTEUR", "IdMoteur", {"IdMoteur", "IdPlateforme"}},
        {"FRANCHISEJEU", "IdJeu", {"IdJeu", "IdFranchise"}},
        {"LOCALISATIONJEU", "IdJeu", {"IdJeu", "IdRegion", "TitreLocalise"}},
    };

    // Générer les triggers
    for (const auto& table : tables) {
        file << "-- Triggers pour la table " << table.name << "\n";
        writeTrigger(file, table, "INSERT");
        writeTrigger(file, table, "UPDATE");
        writeTrigger(file, table, "DELETE");
        file << "\n";
    }

    file.close();
    std::cout << "Fichier 'triggers_corriges.sql' généré avec succès!\n";
    std::cout << "Pour vider la table LOG, utilisez: DELETE FROM LOG; ou TRUNCATE TABLE LOG;\n";
    return 0;
}
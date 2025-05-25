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
        file << "    val_apres VARCHAR2(4000);\n";
        file << "BEGIN\n";
        // construire la valeur apres
        file << "    val_apres := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << ":NEW." << table.columns[i];
        }
        file << ";\n";
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)\n";
        file << "    VALUES(USER, '" << action << "', SYSTIMESTAMP, :NEW." << table.idColumn << ", NULL, NULL, val_apres, '" << table.name << "');\n";
        file << "END;\n";
    }
    else if (action == "DELETE") {
        file << "DECLARE\n";
        file << "    val_avant VARCHAR2(4000);\n";
        file << "BEGIN\n";
        // construire la valeur avant
        file << "    val_avant := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << ":OLD." << table.columns[i];
        }
        file << ";\n";
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)\n";
        file << "    VALUES(USER, '" << action << "', SYSTIMESTAMP, :OLD." << table.idColumn << ", NULL, val_avant, NULL, '" << table.name << "');\n";
        file << "END;\n";
    }
    else if (action == "UPDATE") {
        file << "DECLARE\n";
        file << "    val_avant VARCHAR2(4000);\n";
        file << "    val_apres VARCHAR2(4000);\n";
        file << "BEGIN\n";
        // construire les valeurs avant et apres
        file << "    val_avant := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << ":OLD." << table.columns[i];
        }
        file << ";\n";
        file << "    val_apres := ";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << " || ' | ' || ";
            file << ":NEW." << table.columns[i];
        }
        file << ";\n";
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)\n";
        file << "    VALUES(USER, '" << action << "', SYSTIMESTAMP, :OLD." << table.idColumn << ", NULL, val_avant, val_apres, '" << table.name << "');\n";
        file << "END;\n";
    }
    
    file << "/\n\n";
}

int main() {
    std::ofstream file("triggers_corriges.sql");
    
    // ajouter un header
    file << "-- Triggers generes automatiquement pour la BDD jeux video\n";
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

    // generer les triggers
    for (const auto& table : tables) {
        writeTrigger(file, table, "INSERT");
        writeTrigger(file, table, "UPDATE");
        writeTrigger(file, table, "DELETE");
    }

    file.close();
    std::cout << "Fichier 'triggers_corriges.sql' genere avec succes!\n";
    std::cout << "Pour vider la table LOG, utilisez: DELETE FROM LOG; ou TRUNCATE TABLE LOG;\n";
    return 0;
}
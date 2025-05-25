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
    
    file << "CREATE OR REPLACE TRIGGER " << triggerName << "\n";
    file << "AFTER " << action << " ON " << table.name << "\n";
    file << "FOR EACH ROW\n";
    file << "BEGIN\n";
    
    if (action == "INSERT") {
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "    VALUES(USER, 'INSERT', SYSTIMESTAMP, NULL, '";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << "|";
            file << "' || :NEW." << table.columns[i] << " || '";
        }
        file << "');\n";
    }
    else if (action == "DELETE") {
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "    VALUES(USER, 'DELETE', SYSTIMESTAMP, '";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << "|";
            file << "' || :OLD." << table.columns[i] << " || '";
        }
        file << "', NULL);\n";
    }
    else if (action == "UPDATE") {
        file << "    INSERT INTO LOG(idAuteur, action, dateHeureAction, ligneAvant, ligneApres)\n";
        file << "    VALUES(USER, 'UPDATE', SYSTIMESTAMP, '";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << "|";
            file << "' || :OLD." << table.columns[i] << " || '";
        }
        file << "', '";
        for (size_t i = 0; i < table.columns.size(); i++) {
            if (i > 0) file << "|";
            file << "' || :NEW." << table.columns[i] << " || '";
        }
        file << "');\n";
    }
    
    file << "END;\n/\n\n";
}

int main() {
    std::ofstream file("triggers_corriges.sql");
    
    file << "-- Triggers pour log automatique\n\n";

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

    for (const auto& table : tables) {
        writeTrigger(file, table, "INSERT");
        writeTrigger(file, table, "UPDATE");
        writeTrigger(file, table, "DELETE");
    }

    file.close();
    std::cout << "Fichier généré!\n";
    return 0;
}
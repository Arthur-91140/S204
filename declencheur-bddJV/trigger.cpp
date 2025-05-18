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
    std::string triggerName = "declencheur_" + table.name + "_" + action;
    std::string timing = "AFTER " + action;
    std::string ref = (action == "INSERT") ? ":NEW" : ":OLD";
    std::string newRef = ":NEW";
    std::string oldRef = ":OLD";

    std::string ligneAvant = "NULL";
    std::string ligneApres = "NULL";

    if (action == "INSERT") {
        ligneApres = "";
        for (const auto& col : table.columns) {
            ligneApres += newRef + "." + col + " || ' | ' || ";
        }
        ligneApres = ligneApres.substr(0, ligneApres.size() - 12); // retirer le dernier " || ' | ' || "
    } else if (action == "DELETE") {
        ligneAvant = "";
        for (const auto& col : table.columns) {
            ligneAvant += oldRef + "." + col + " || ' | ' || ";
        }
        ligneAvant = ligneAvant.substr(0, ligneAvant.size() - 12);
    } else if (action == "UPDATE") {
        ligneAvant = "";
        ligneApres = "";
        for (const auto& col : table.columns) {
            ligneAvant += oldRef + "." + col + " || ' | ' || ";
            ligneApres += newRef + "." + col + " || ' | ' || ";
        }
        ligneAvant = ligneAvant.substr(0, ligneAvant.size() - 12);
        ligneApres = ligneApres.substr(0, ligneApres.size() - 12);
    }

    file << "CREATE OR REPLACE TRIGGER " << triggerName << "\n";
    file << timing << " ON " << table.name << "\n";
    file << "FOR EACH ROW\n";
    file << "BEGIN\n";
    file << "  INSERT INTO LOG(idAuteur, action, dateHeureAction, idEnregistrement, colonneMaj, valeurAvant, valeurApres, nomTable)\n";
    file << "  VALUES(user, '" << action << "', SYSTIMESTAMP, ";
    file << ((action == "INSERT") ? ":NEW." : ":OLD.") << table.idColumn << ", NULL, ";
    file << ((ligneAvant == "NULL") ? "NULL" : ligneAvant) << ", ";
    file << ((ligneApres == "NULL") ? "NULL" : ligneApres) << ", '" << table.name << "');\n";
    file << "END;\n/\n\n";
}

int main() {
    std::ofstream file("triggers.sql");

    std::vector<Table> tables = {
        {"CATEGORIEJEU", "IdCategorieJeu", {"IdCategorieJeu", "NomGenre"}},
        {"CATEGORIEPLATEFORME", "IdCategoriePlateforme", {"IdCategoriePlateforme", "NomCategoriePlateforme"}},
        {"CLASSIFICATIONAGE", "IdClassification", {"IdClassification", "OrganismeClassification", "Classification", "SynopsisClassification"}},
        {"COMPAGNIE", "IdCompagnie", {"IdCompagnie", "nomCompagnie", "DescrCompagnie", "PaysCompagnie", "DateFondationCompagnie", "DateMAJCompagnie"}},
        {"DATESORTIE", "IdDateSortie", {"IdDateSortie", "DateSortie", "RegionSortie", "StatutSortie", "DateMAJDateSortie"}},
        {"FRANCHISE", "IdFranchise", {"IdFranchise", "NomFranchise"}},
        {"JEU", "IdJeu", {"IdJeu", "TitreJeu", "TitreVersionJeu", "HistoireJeu", "ResumeJeu", "ScoreAgregeJeu", "NombreNotesAgregeesJeu", "ScoreIGDB", "NombreNotesIGDBJeu", "ScoreJeu", "NombreNotesJeu", "TempsJeu_Normal", "TempsJeu_Rapide", "TempsJeu_Complet", "NombreTempsJeu", "StatutJeu", "DateMAJJeu"}},
        {"GENRE", "IdGenre", {"IdGenre", "NomGenre"}},
        {"MODALITE", "IdModalite", {"IdModalite", "NomModalite"}},
        {"MODEMULTIJOUEUR", "IdModeMultiJoueur", {"IdModeMultiJoueur", "DropIn", "ModeCoopCampagne", "ModeCoopLAN", "ModeCoopOffline", "ModeCoopOnline", "ModeSplitScreen", "NbJoueursMaxCoopOffline", "NbJoueursMaxOffline", "NbJoueursMaxCoopOnline", "NbJoueursMaxOnline"}},
        {"MOTCLE", "IdMotCle", {"IdMotCle", "NomMotCle"}},
        {"MOTEUR", "IdMoteur", {"IdMoteur", "NomMoteur", "DescrMoteur", "DateMAJMoteur"}},
        {"PLATEFORME", "IdPlateforme", {"IdPlateforme", "NomPlateforme", "AbbreviationPlateforme", "NomAlternatifPlateforme", "DescriptifPlateforme", "GenerationPlateforme"}},
        {"POPULARITE", "MesurePopularite", {"MesurePopularite", "ValeurPopularite"}},
        {"REGION", "IdRegion", {"IdRegion", "NomRegion"}},
        {"THEME", "IdTheme", {"IdTheme", "NomTheme"}},
        {"TITREALTERNATIF", "IdTitreAlternatif", {"IdTitreAlternatif", "LibelleTitreAlternatif"}}
    };

    for (const auto& table : tables) {
        writeTrigger(file, table, "INSERT");
        writeTrigger(file, table, "UPDATE");
        writeTrigger(file, table, "DELETE");
    }

    file.close();
    std::cout << "Fichier 'triggers.sql' généré avec succès.\n";
    return 0;
}


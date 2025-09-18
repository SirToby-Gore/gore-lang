#include "main.h"

Globals globals = Globals();

std::vector<std::string> readFile(char* path) {
    std::vector<std::string> fileContents;
    std::fstream file(path);

    if (!file.is_open()) {
        throw std::runtime_error("unable to read file path");
    }

    std::string line;
    
    while (std::getline(file, line)) {
        fileContents.push_back(line);
    }

    file.close();

    return fileContents;
} 

std::string getNameSpace(std::string& line) {
    std::regex pattern(R"(^\s*(const|var)?\s*((int|double|bool|string|list|map)(\??))?\s*([a-zA-Z_]\w*(\.[a-zA-Z_]\w*)*)\s*=\s*(.*)$)");
    std::smatch match;
    
    if (!std::regex_search(line, match, pattern)) {
        return "";
    }

    return match.str(3);
}

void createObjectFromString(std::string& line) {
    std::regex pattern(R"(^\s*(const|var)?\s*((int|double|bool|string|list|map)(\??))?\s*([a-zA-Z_]\w*(\.[a-zA-Z_]\w*)*)\s*=\s*(.*)$)");
    std::smatch match;
    std::map<std::string, bool> mutability = {
        {"const", true},
        {"var", false}
    };
    std::map<std::string, bool> nullability = {
        {"?", true},
        {"", false}
    };

    if (!std::regex_search(line, match, pattern)) {
        std::cerr << "Error: No regex match found in createObjectFromString." << std::endl;
        return;
    }

    std::string mutableStr = match.str(1);
    std::string typeStr = match.str(3);
    std::string nullStr = match.str(4);
    std::string namespaceStr = match.str(5);
    std::string valueStr = match.str(7);

    Object newObject = Object(valueStr, mutability[mutableStr], nullability[nullStr]);

    globals.add(namespaceStr, newObject);
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        throw std::runtime_error("too few args, please provide one argument of path to run \n \t Usage: gore <input path>");
    }
    
    std::vector<std::string> lines = readFile(argv[1]);

    std::cout << "```" << std::endl;
    
    std::string line;
    for (int lineNumber = 0; lineNumber <= lines.size() - 1; lineNumber++) {
        line = lines[lineNumber];

        std::string namespaceInLine = getNameSpace(line);

        std::cout << line << std::endl;
        
        if (namespaceInLine != "") {
            std::cout << "Namespace found: " << namespaceInLine << std::endl;
            createObjectFromString(line);
        }
    }

    std::cout << "```" << std::endl;

    globals.varDump();

    std::cout << std::endl;

    return 0;
}



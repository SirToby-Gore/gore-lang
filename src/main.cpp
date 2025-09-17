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

int main(int argc, char* argv[]) {
    if (argc < 2) {
        throw std::runtime_error("too few args, please provide one argument of path to run");
    }
    
    std::vector<std::string> lines = readFile(argv[1]);

    std::cout << "```" << std::endl;
    
    std::string line;
    for (int lineNumber = 0; lineNumber <= lines.size() - 1; lineNumber++) {
        line = lines[lineNumber];

        std::cout << line << std::endl;
    }

    std::cout << "```" << std::endl;
    
    
    std::cout << std::endl;

    return 0;
}



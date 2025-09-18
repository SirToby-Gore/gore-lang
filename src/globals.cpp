#include "globals.h"

void Globals::add(std::string namespaceString, Object& object) {
    this->namespaces[namespaceString] = object;
}

Object& Globals::fetch(std::string namespaceString) {
    return this->namespaces[namespaceString];
}

void Globals::remove(std::string namespaceStirng) {
    this->namespaces.erase(namespaceStirng);
}

void Globals::varDump() {
    for ( const auto &myPair : this->namespaces ) {
        std::string key = myPair.first;

        std::cout << key << ": " << this->namespaces[key].toString().toStr() << " " << this->namespaces[key].typeToStr() << std::endl;
    }
}

void Globals::varDump(std::string& key) {
    std::cout << key << ": " << this->namespaces[key].toString().toStr() << this->namespaces[key].typeToStr() << std::endl;
}
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
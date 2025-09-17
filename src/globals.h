#ifndef GLOBALS_H
#define GLOBALS_H

#include "object.h"
#include <map>
#include <string>

class Globals {
    std::map<std::string, Object> namespaces;

public:
    void add(std::string namespaceString, Object& object);
    Object& fetch(std::string namespaceString);
    void remove(std::string namespaceStirng);
};

#endif
#include "functions.h"

void print(Object& object, Object& lineEnd, Object& newLine) {
    if (newLine.getType() != ObjectType::Bool) {
        throw std::runtime_error("New line arg must be of type Bool");
    }

    if (lineEnd.getType() != ObjectType::String) {
        throw std::runtime_error("Line end arg must be of type String");
    }
    
    if (newLine.boolData) {
        std::cout << std::endl;
    }

    std::cout << object.toString().toStr();
}

void printVal(Object& object) {
    std::cout << object.toString().toStr() << std::endl; 
}
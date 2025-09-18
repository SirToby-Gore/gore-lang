#ifndef OBJECT_H
#define OBJECT_H

#include <string>
#include <vector>
#include <regex>
#include <map>
#include <typeinfo>
#include <stack>
#include <stdexcept>

enum ObjectType {
    Int,
    Double,
    String,
    Bool,
    List,
    Map,
    Pointer,
    Void,
};

class Object {
public:
    ObjectType type = ObjectType::Void;
    bool constant;
    bool nullable;
    
    int64_t intData;
    double doubleData;
    std::string stringData;
    bool boolData;
    std::vector<Object> listData;
    std::map<Object, Object> mapData;
    Object* object = nullptr;

    Object() {}

    Object(std::string& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->constant = constant;
        
        std::regex stringPattern("^\"(.*)\"$");
        std::regex intPattern("^\\-?[0-9]+$");
        std::regex doublePattern("^\\-?[0-9]+\\.[0-9]+$");
        std::regex boolPattern("^true|false$");
        std::regex listPattern("^\\[.*\\]$");
        std::regex mapPattern("^\\{.*\\}$");
        std::regex nullPattern("^null$");
    
        std::smatch matches;    

        if (std::regex_search(value, matches, stringPattern)) {
            this->stringData = matches.str(1);
            this->type = ObjectType::String;

            return;
        }

        if (std::regex_search(value, intPattern)) {
            this->intData = std::stoi(value);
            this->type = ObjectType::Int;

            return;
        }

        if (std::regex_search(value, doublePattern)) {
            this->doubleData = std::stod(value);
            this->type = ObjectType::Double;

            return;
        }

        if (std::regex_search(value, boolPattern)) {
            if (value == "true") {
                this->boolData = true;
            } else {
                this->boolData = false;
            }

            this->type = ObjectType::Bool;

            return;
        }

        if (std::regex_search(value, nullPattern)) {
            return;
        }

        if (std::regex_search(value, listPattern)) {
            // TODO: make list parser

            this->type = ObjectType::List;

            return;
        }

        if (std::regex_search(value, mapPattern)) {
            // TODO: Make map parser
            
            this->type = ObjectType::Map;

            return;
        }

        throw std::runtime_error("invalid data given for value");
    }

    Object(const int& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Int;
        this->intData = value;
        this->constant = constant;
    }
    Object(const int64_t& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Int;
        this->intData = value;
        this->constant = constant;
    }
    Object(const double& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Double;
        this->intData = value;
        this->constant = constant;
    }
    Object(const bool& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Bool;
        this->boolData = value;
        this->constant = constant;
    }
    Object(const std::string& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::String;
        this->stringData = value;
        this->constant = constant;
    }
    Object(const std::vector<Object>& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::List;
        this->listData = value;
        this->constant = constant;
    }
    Object(const std::map<Object, Object>& value, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Map;
        this->mapData = value;
        this->constant = constant;
    }
    Object(Object* object, bool constant = false, bool nullable = false) {
        this->nullable = nullable;
        this->type = ObjectType::Pointer;
        this->object = object;
        this->constant = constant;
    }
    
    template <typename T> T& getValue();

    ObjectType getType() const;
    std::string typeToStr() const;

    Object toString() const;
    std::string toStr() const;

    Object multiply(Object& other);
    Object add(Object& other);
    Object divide(Object& other);
    Object subtract(Object& other);
    Object modulo(Object& other);
    Object intDivision(Object& other);
};

#endif
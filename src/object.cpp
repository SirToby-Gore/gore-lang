#include "object.h"

template <typename T> T& Object::getValue() {
    if (this->type == ObjectType::Pointer) {
        // Explicitly pass the template type T
        return this->object->getValue<T>();
    } else if constexpr (std::is_same_v<T, int64_t>) {
        if (this->type == ObjectType::Int) {
            return this->intData;
        }
    } else if constexpr (std::is_same_v<T, double>) {
        if (this->type == ObjectType::Double) {
            return this->doubleData;
        }
    } else if constexpr (std::is_same_v<T, std::string>) {
        if (this->type == ObjectType::String) {
            return this->stringData;
        }
    } else if constexpr (std::is_same_v<T, bool>) {
        if (this->type == ObjectType::Bool) {
            return this->boolData;
        }
    } else if constexpr (std::is_same_v<T, std::vector<Object>>) {
        if (this->type == ObjectType::List) {
            return this->listData;
        }
    } else if constexpr (std::is_same_v<T, std::map<Object, Object>>) {
        if (this->type == ObjectType::Map) {
            return this->mapData;
        }
    }

    throw std::bad_cast();
}

ObjectType Object::getType() const {
    if (this->type == ObjectType::Pointer) {
        return this->object->getType();
    }

    return this->type;
}

Object Object::toString() const {
    Object newObject = Object(this->toStr());
    return newObject; // Add this return statement
}

std::string Object::toStr() const {
    std::string stringValue;
    
    switch (this->type) {
        case ObjectType::Int:
            stringValue = std::to_string(this->intData);
            break;
        
        case ObjectType::Double:
            stringValue = std::to_string(this->doubleData);
            break;

        case ObjectType::Bool:
            if (this->boolData) {
                stringValue = "TRUE";
                break;
            }
            stringValue = "FALSE";
            break;

        case ObjectType::String:
            stringValue = this->stringData;
            break;

        case ObjectType::Void:
            stringValue = "Void";
            break;

        case ObjectType::List:
            stringValue = "[...]";
            break;
        
        case ObjectType::Map:
            stringValue = "{...}";
            break;

        case ObjectType::Pointer:
            // Correctly handle the pointer case
            if (this->object != nullptr) {
                stringValue = this->object->toStr();
                break;
            } else {
                stringValue = "NULL_POINTER";
                break;
            }

        default:
            stringValue = "|Unknown|";
            break;
    }
    
    return stringValue;
}

std::string Object::typeToStr() const {
    std::string typeName;
    
    switch (this->type) {
        case ObjectType::Int:
            typeName = "Int";
            break;
        
        case ObjectType::Double:
            typeName = "Double";
            break;

        case ObjectType::Bool:
            typeName = "Bool";
            break;

        case ObjectType::String:
            typeName = "String";
            break;

        case ObjectType::List:
            typeName = "List";
            break;
        
        case ObjectType::Map:
            typeName = "List";
            break;

        case ObjectType::Pointer:
            // Correctly handle the pointer case
            if (this->object != nullptr) {
                typeName = this->object->typeToStr();
                break;
            } else {
                typeName = "NULL_POINTER";
                break;
            }

        default:
            typeName = "|Unknown|";
            break;
    }

    if (this->nullable) {
        typeName += "?";
    }

    return typeName;
}

Object Object::multiply(Object& other) {
    if (!(other.getType() == ObjectType::Double || other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Double || this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-numeric");
    }
    
    if (other.getType() == ObjectType::Double) {
        if (this->getType() == ObjectType::Double) {
            return Object(this->getValue<double>() * other.getValue<double>());
        }
        return Object(this->getValue<int64_t>() * other.getValue<double>());
    }

    if (this->getType() == ObjectType::Double) {
        return Object(this->getValue<double>() * other.getValue<int64_t>());
    }

    return Object(this->getValue<int64_t>() * other.getValue<int64_t>());
}

Object Object::add(Object& other) {
    if (!(other.getType() == ObjectType::Double || other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Double || this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-numeric");
    }
    
    if (other.getType() == ObjectType::Double) {
        if (this->getType() == ObjectType::Double) {
            return Object(this->getValue<double>() + other.getValue<double>());
        }
        return Object(static_cast<double>(this->getValue<int64_t>()) + other.getValue<double>());
    }

    if (this->getType() == ObjectType::Double) {
        return Object(this->getValue<double>() + other.getValue<double>());
    }

    return Object(this->getValue<int64_t>() + other.getValue<int64_t>());
}

Object Object::divide(Object& other) {
    if (!(other.getType() == ObjectType::Double || other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Double || this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-numeric");
    }

    if (other.getType() == ObjectType::Double) {
        if (this->getType() == ObjectType::Double) {
            return Object(this->getValue<double>() / other.getValue<double>());
        }
        return Object(static_cast<double>(this->getValue<int64_t>()) / other.getValue<double>());
    }

    if (this->getType() == ObjectType::Double) {
        return Object(this->getValue<double>() / other.getValue<double>());
    }

    return Object(static_cast<double>(this->getValue<int64_t>()) / other.getValue<double>());
}

Object Object::subtract(Object& other) {
    if (!(other.getType() == ObjectType::Double || other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Double || this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-numeric");
    }
    
    if (other.getType() == ObjectType::Double) {
        if (this->getType() == ObjectType::Double) {
            return Object(this->getValue<double>() - other.getValue<double>());
        }
        return Object(static_cast<double>(this->getValue<int64_t>()) - other.getValue<double>());
    }

    if (this->getType() == ObjectType::Double) {
        return Object(this->getValue<double>() - other.getValue<double>());
    }

    return Object(this->getValue<int64_t>() - other.getValue<int64_t>());
}

Object Object::modulo(Object& other) {
    if (!(other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-integer");
    }

    return Object(this->getValue<int64_t>() % other.getValue<int64_t>());
}

Object Object::intDivision(Object& other) {
    if (!(other.getType() == ObjectType::Int) || !(this->getType() == ObjectType::Int)) {
        throw std::runtime_error("one or more values are non-integer");
    }
    
    return Object(this->getValue<int64_t>() / other.getValue<int64_t>());
}
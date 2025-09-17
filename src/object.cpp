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
    switch (this->type) {
        case ObjectType::Int:
            return std::to_string(this->intData);
        
        case ObjectType::Double:
            return std::to_string(this->intData);

        case ObjectType::Bool:
            if (this->boolData) {
                return "TRUE";
            }
            return "FALSE";

        case ObjectType::String:
            return this->stringData;

        case ObjectType::Null:
            return "NULL";

        case ObjectType::List:
            return "[...]";
        
        case ObjectType::Map:
            return "{...}";

        case ObjectType::Pointer:
            // Correctly handle the pointer case
            if (this->object != nullptr) {
                return this->object->toStr();
            } else {
                return "NULL_POINTER";
            }

        default:
            return "";
    }
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
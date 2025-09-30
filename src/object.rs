use std::collections::HashMap;
use std::fmt;
use std::error::Error;

// Custom Error Type (Equivalent to throwing std::runtime_error/std::bad_cast)
#[derive(Debug)]
pub struct TypeError {
    pub message: String,
}

impl fmt::Display for TypeError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.message)
    }
}

impl Error for TypeError {}

// Corresponds to ObjectType enum
#[derive(Debug, Clone, PartialEq, Eq, Hash)] // Needs Hash for Map keys
pub enum ObjectData {
    Int(i64),
    Double(f64),
    String(String),
    Bool(bool),
    List(Vec<Object>),
    Map(HashMap<Object, Object>),
    // Note: Rust pointers are often handled via smart pointers or simply passing references
    // For this self-contained conversion, we'll omit a direct 'Pointer' variant for simplicity.
    Void,
}

// Corresponds to the Object class
#[derive(Debug, Clone, PartialEq, Eq, Hash)] // Needs Hash for Map keys
pub struct Object {
    // Note: Rust doesn't need C++'s `this->`
    pub data: ObjectData,
    pub constant: bool,
    pub nullable: bool,
}

impl Object {
    // --- Constructor-like functions ---

    pub fn new_int(value: i64, constant: bool, nullable: bool) -> Self {
        Object {
            data: ObjectData::Int(value),
            constant,
            nullable,
        }
    }
    
    // ... (other constructors like new_double, new_string, etc.)

    // Equivalent to Object::getType()
    pub fn get_type(&self) -> &str {
        match &self.data {
            ObjectData::Int(_) => "Int",
            ObjectData::Double(_) => "Double",
            ObjectData::String(_) => "String",
            ObjectData::Bool(_) => "Bool",
            ObjectData::List(_) => "List",
            ObjectData::Map(_) => "Map",
            ObjectData::Void => "Void",
        }
    }

    // Equivalent to Object::typeToStr()
    pub fn type_to_str(&self) -> String {
        let base_type = self.get_type().to_string();
        if self.nullable {
            format!("{}?", base_type)
        } else {
            base_type
        }
    }
    
    // --- Safe Value Access (Equivalent to Object::getValue<T>()) ---
    // Rust uses `Result` for error handling instead of exceptions.
    // This function returns a reference to the inner data if the types match.
    pub fn get_int(&self) -> Result<i64, TypeError> {
        if let ObjectData::Int(val) = self.data {
            Ok(val)
        } else {
            Err(TypeError { message: format!("Cannot cast {} to Int", self.get_type()) })
        }
    }
    
    // pub fn get_double(&self) -> Result<f64, TypeError> { ... }
    
    // --- Arithmetic Operations (Equivalent to Object::multiply, Object::add, etc.) ---
    
    pub fn multiply(&self, other: &Object) -> Result<Object, TypeError> {
        use ObjectData::*;
        
        match (&self.data, &other.data) {
            (Int(a), Int(b)) => Ok(Object::new_int(a * b, false, false)),
            (Int(a), Double(b)) => Ok(Object::new_double(*a as f64 * b, false, false)),
            (Double(a), Int(b)) => Ok(Object::new_double(a * *b as f64, false, false)),
            (Double(a), Double(b)) => Ok(Object::new_double(a * b, false, false)),
            _ => Err(TypeError { message: format!("Cannot multiply non-numeric types: {} and {}", self.get_type(), other.get_type()) }),
        }
    }

    // pub fn add(&self, other: &Object) -> Result<Object, TypeError> { ... }
    // pub fn divide(&self, other: &Object) -> Result<Object, TypeError> { ... }
    // pub fn subtract(&self, other: &Object) -> Result<Object, TypeError> { ... }

    pub fn modulo(&self, other: &Object) -> Result<Object, TypeError> {
        match (&self.data, &other.data) {
            (ObjectData::Int(a), ObjectData::Int(b)) => Ok(Object::new_int(a % b, false, false)),
            _ => Err(TypeError { message: "Modulo operation requires both operands to be Int".to_string() }),
        }
    }
}

// Trait implementation for printing (equivalent to toStr and toString)
impl fmt::Display for Object {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match &self.data {
            ObjectData::Int(val) => write!(f, "{}", val),
            ObjectData::Double(val) => write!(f, "{}", val),
            ObjectData::String(val) => write!(f, "{}", val),
            ObjectData::Bool(val) => write!(f, "{}", if *val { "TRUE" } else { "FALSE" }),
            ObjectData::Void => write!(f, "Void"),
            ObjectData::List(_) => write!(f, "[...]"),
            ObjectData::Map(_) => write!(f, "{{...}}"),
        }
    }
}
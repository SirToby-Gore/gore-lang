use crate::object::Object;
use std::collections::HashMap;
use std::io::{self, Write};

pub struct Globals {
    namespaces: HashMap<String, Object>,
}

impl Globals {
    // Constructor (Associated function)
    pub fn new() -> Self {
        Globals {
            namespaces: HashMap::new(),
        }
    }

    // Equivalent to Globals::add
    pub fn add(&mut self, namespace_string: String, object: Object) {
        // Rust's HashMap::insert() replaces C++'s operator[] =
        self.namespaces.insert(namespace_string, object);
    }

    // Equivalent to Globals::fetch
    // Returns Option<&Object> because the key might not exist (safer than C++ operator[])
    pub fn fetch(&self, namespace_string: &str) -> Option<&Object> {
        // Rust's HashMap::get() is the safe equivalent
        self.namespaces.get(namespace_string)
    }

    // Equivalent to Globals::remove
    pub fn remove(&mut self, namespace_string: &str) {
        // Rust's HashMap::remove() replaces C++'s erase()
        self.namespaces.remove(namespace_string);
    }

    // Equivalent to Globals::varDump()
    pub fn var_dump(&self) {
        // Use Rust's `println!` macro for output
        for (key, object) in &self.namespaces {
            // Using the `Display` trait implementation for Object to replace toString().toStr()
            println!("{}: {} {}", key, object, object.type_to_str());
        }
    }

    // Equivalent to Globals::varDump(std::string& key)
    pub fn var_dump_key(&self, key: &str) {
        match self.namespaces.get(key) {
            Some(object) => println!("{}: {} {}", key, object, object.type_to_str()),
            None => println!("Key '{}' not found in globals.", key),
        }
    }
}
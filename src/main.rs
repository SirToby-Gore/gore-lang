mod object;
mod globals;
mod functions;

use globals::Globals;
use object::{Object, TypeError};
use std::fs::File;
use std::io::{self, BufReader, BufRead};
use regex::Regex;

// Global variable is replaced by a lazy static or, simpler, by passing the Globals instance.
// For this example, we initialize it in main().

// Equivalent to std::vector<std::string> readFile(char* path)
fn read_file(path: &str) -> io::Result<Vec<String>> {
    let file = File::open(path)?;
    let reader = BufReader::new(file);
    let lines: io::Result<Vec<String>> = reader.lines().collect();
    lines
}

// The regexes are moved inside main or initialized as lazy statics for efficiency.

fn get_namespace(line: &str, pattern: &Regex) -> String {
    if let Some(captures) = pattern.captures(line) {
        // match.str(3) corresponds to the 3rd capture group (the type string)
        captures.get(3).map_or("", |m| m.as_str()).to_string()
    } else {
        String::new()
    }
}

fn create_object_from_string(line: &str, pattern: &Regex, globals: &mut Globals) -> Result<(), Box<dyn std::error::Error>> {
    let mut mutability = HashMap::new();
    mutability.insert("const", true);
    mutability.insert("var", false);

    let mut nullability = HashMap::new();
    nullability.insert("?", true);
    nullability.insert("", false);
    
    // 0: Full match, 1: mutability, 2: full type, 3: base type, 4: nullability, 5: namespace, 6: dot-chain, 7: value
    if let Some(captures) = pattern.captures(line) {
        let mutable_str = captures.get(1).map_or("", |m| m.as_str());
        // let type_str = captures.get(3).map_or("", |m| m.as_str()); // not strictly needed for the Object constructor in C++
        let null_str = captures.get(4).map_or("", |m| m.as_str());
        let namespace_str = captures.get(5).map_or("", |m| m.as_str()).to_string();
        let value_str = captures.get(7).map_or("", |m| m.as_str()).to_string();

        let constant = *mutability.get(mutable_str).unwrap_or(&false);
        let nullable = *nullability.get(null_str).unwrap_or(&false);
        
        // This is a placeholder for the C++ Object(valueStr, ...) constructor logic
        // In a real Rust app, you'd parse the value_str here.
        // For simplicity, we assume the value is an integer.
        let new_object = if let Ok(val) = value_str.parse::<i64>() {
            Object::new_int(val, constant, nullable)
        } else {
            // Placeholder for string/double/etc. parsing
            Object::new_string(value_str, constant, nullable)
        };
        
        globals.add(namespace_str, new_object);
    } else {
        eprintln!("Error: No regex match found in create_object_from_string.");
    }
    
    Ok(())
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = std::env::args().collect();

    if args.len() < 2 {
        return Err("Too few args, please provide one argument of path to run \n \t Usage: gore <input path>".into());
    }
    
    // C++ regex patterns
    let pattern_declaration = Regex::new(r"^\s*(const|var)?\s*((int|double|bool|string|list|map)(\??))?\s*([a-zA-Z_]\w*(\.[a-zA-Z_]\w*)*)\s*=\s*(.*)$")?;
    // let pattern_function = Regex::new(r"([a-zA-Z_]\w+)\([a-zA-Z_]+,?)\)")?;
    // let pattern_argument = Regex::new(r"([a-zA-Z_]+,?)")?;

    let lines = read_file(&args[1])?;
    let mut globals = Globals::new();

    println!("```");
    
    for line in lines.iter() {
        let namespace_in_line = get_namespace(line, &pattern_declaration);

        println!("{}", line);
        
        if !namespace_in_line.is_empty() {
            println!("Namespace found: {}", namespace_in_line);
            if let Err(e) = create_object_from_string(line, &pattern_declaration, &mut globals) {
                eprintln!("Error creating object: {}", e);
            }
        }
    }

    println!("```");

    globals.var_dump();

    println!();

    Ok(())
}
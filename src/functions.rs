use crate::object::{Object, ObjectData, TypeError};
use std::io::{self, Write};

// Equivalent to void print(Object& object, Object& lineEnd, Object& newLine)
pub fn print_object(object: &Object, line_end: &Object, new_line: &Object) -> Result<(), TypeError> {
    
    // Use `Result` for error checking
    let new_line_bool = new_line.get_bool().map_err(|_| {
        TypeError { message: "New line arg must be of type Bool".to_string() }
    })?;

    let line_end_str = line_end.get_string().map_err(|_| {
        TypeError { message: "Line end arg must be of type String".to_string() }
    })?;
    
    if new_line_bool {
        println!();
    }

    // `object` implements the Display trait, so we can print it directly
    print!("{}", object);
    io::stdout().flush().unwrap(); // Flush needed to ensure print! output appears immediately
    
    Ok(())
}

// Equivalent to void printVal(Object& object)
pub fn print_val(object: &Object) {
    println!("{}", object);
}
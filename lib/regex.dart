/// (whitespace)<mutability>(whitespace)<type>(whitespace)<namespace>(whitespace?)=(whitespace?)<value>
final assignment = RegExp(r'^\s*(?<mutability>\w+)\s+(?<type>\w+)\s+(?<namespace>\w+)\s*=\s*(?<value>.+)$');

/// (whitespace)<namespace>(whitespace?)=(whitespace?)<value>
final reAssignment = RegExp(r'^\s*(?<namespace>\w+)\s*=\s*(?<value>.+)$');
  
/// import(whitespace)<path>
final importLine = RegExp(r'^import\w+(?<path>.+)$', multiLine: false);

/// (gre\gore):<path>
final externalImport = RegExp(r'^(gre|gore):(?<path>.+)$', multiLine: false);

/// (whitespace?)//
final comment = RegExp(r'^\s*//.*$');

/// (whitespace?)
final emptyLine = RegExp(r'^\s*$');
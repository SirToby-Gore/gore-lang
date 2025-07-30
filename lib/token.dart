import 'package:gore_lang/_common.dart';
import 'package:gore_lang/regex.dart' as regex;

const List<String> tokenObjectTypes = [
  'char',
  'string', 
  'int', 
  'double',
  'bool',
  'list',
  'map',
  'function',
  'type',
];

const Map<String, bool> tokenMutableStates = {
  'final': false,
  'const': false,
  'var': true,
  '': true
};

List<Token> tokenise(List<String> code) {
  List<Token> tokens = [];
  Map<String, Namespace> globalNamespace = {};

  for (String line in code) {
    if (regex.assignment.hasMatch(line)) {
      RegExpMatch assignmentMatch = regex.assignment.firstMatch(line)!;

      String mutability = assignmentMatch.namedGroup('mutability') ?? '';
      String type = assignmentMatch.namedGroup('type')!;
      String namespace = assignmentMatch.namedGroup('namespace')!;
      String value = assignmentMatch.namedGroup('value')!;

      if (!tokenMutableStates.keys.contains(mutability)) {
        terminal.error('Line "$line" has an invalid setting for mutability, "$mutability"');
        throw SyntaxError();
      }

      if (!tokenObjectTypes.contains(type)) {
        terminal.error('Line "$line" has an invalid type, "$type"');
        throw SyntaxError();
      }
      
      Namespace? sharedName = globalNamespace[namespace];
      Namespace thisNamespace = Namespace(namespace, mutability, type);

      if (sharedName == null || tokenMutableStates[mutability]!) {
        tokens.add(AssignmentToken(
          thisNamespace,
          RawToken(value),
        ));
      }
    } else {

    }
  } 

  return tokens;
}

class Namespace {
  String namespace;
  String mutability;
  String type;

  Namespace(this.namespace, this.mutability, this.type);
}

class Token {
  String whitespace = '  ';

  String render([int indent = 0, List<int> style = const []]) {
    return '';
  }
}

class RawToken extends Token {
  String value;

  RawToken(this.value);

  @override
  String render([int indent = 0, List<int> style = const []]) {
    return '${whitespace * indent}$value';
  }
}

class TokenCodeBlock extends Token {
  List<Token> code;

  TokenCodeBlock(this.code);

  @override
  String render([int indent = 0, List<int> style = const []]) {
    return code.map((code) => code.render(indent + 1)).join('\n');
  }
}

class AssignmentToken extends Token {
  Namespace namespace;
  Token value;

  AssignmentToken(this.namespace, this.value);

  @override
  String render([int indent = 0, List<int> style = const [Colour.foregroundRed]]) {
    return '${whitespace*indent}${Ansi.construct(style)}${namespace.mutability} ${namespace.type} ${namespace.namespace} = ${value.render()}${Ansi.construct([Effect.reset])}';
  }
}
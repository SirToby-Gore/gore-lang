import 'package:gore_lang/_common.dart';
import 'package:args/args.dart' as args;
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart' as yaml;

// void main(List<String> arguments) {
//   int exitCodeFunc = 0;

//   try {
//     exitCode = mainWrapper(arguments); //.then((int exitCode) => exitCodeFunc = exitCode);
//   } catch (e) {
//     terminal.error('Something went wrong :(\nPlease read the docs for help.');
//     terminal.error(e.toString());
//   } finally {
//     // terminal.print('Exiting with code: $exitCodeFunc', newLine: true);
//     terminal.endOfFile();
//     exit(exitCodeFunc);
//   }
// }

// int mainWrapper(List<String> arguments) {
int main(List<String> arguments) {
  const List<String> modes = [
    'gre',
    'asm',
    'bin',
  ];

  args.ArgParser argParser = args.ArgParser()
    ..addFlag('help',
      abbr: 'h',
      defaultsTo: false,
      help: '-h, --help: shows a help message',
    )
    ..addFlag('version',
      abbr: 'v',
      defaultsTo: false,
      help: '-v, --version: shows a info screen on the gore lang'
    )
    ..addOption('input',
      abbr: 'i',
      defaultsTo: 'bin/main.gr',
      mandatory: false,
      help: '-i, --input: used for the input file to read from',
    )
    ..addOption('output',
      abbr: 'o',
      defaultsTo: null,
      mandatory: false,
      help: '-o, --output: used for the out of the file',
    )
    ..addOption('mode',
      abbr: 'm',
      allowed: modes,
      defaultsTo: 'bin',
      mandatory: false,
      help: '-m, --mode: allows the output to be any of the following formats (${modes.join(', ')})',
    )
  ;

  args.ArgResults parsedArgs = argParser.parse(arguments);

  if (parsedArgs['help']) {
    terminal.print('USAGE:', newLine: true);
    terminal.print('dart run bin/gore_lang.dart -i <input file> (-h, -o <output file>, -m <mode: (${modes.join(', ')})>)', newLine: true);
    terminal.print(argParser.usage, newLine: true);

    return 0;
  }

  if (parsedArgs['version']) {
    Map info = yaml.loadYaml(File(path.join(goreLangBasePath, 'pubspec.yaml')).readAsStringSync());
    
    terminal.info('Version: ${info['version']}');

    return 0;
  }

  final String mode = parsedArgs['mode'];
  final String input = path.absolute(parsedArgs['input']);
  final String output = parsedArgs['output'] ?? path.join(path.dirname(input), '${path.basenameWithoutExtension(input)}.$mode');

  if (!File(input).existsSync()) {
    terminal.error('file $input not found');
    throw MissingFile();
  }

  final compiler = Compiler(
    input,
    output,
    mode
  );

  terminal.info('Preprocessed:');
  terminal.print('```\n${compiler.preprocessFile()}\n```', newLine: true);
  terminal.info('Tokenised:');
  terminal.print(compiler.preformattedToToken().render(-1));

  terminal.endOfFile();

  return 0;
}
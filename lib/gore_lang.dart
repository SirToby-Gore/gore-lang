import 'package:gore_lang/_common.dart';
import 'package:path/path.dart' as path;
import 'package:gore_lang/regex.dart' as regex;

class Compiler {
  List<String> paths  = [];
  List<String> sourceCode = [];
  List<String> preprocessedCode = [];
  List<String> assembledCode = [];

  final String basePath;
  final String outputPath;
  final String mode;

  Compiler(this.basePath, this.outputPath, this.mode) {
    sourceCode = readAndImportFile(basePath);
  }
  
  String preprocessFile() {
    preprocessedCode.addAll(preprocessCode(sourceCode));

    return preprocessedCode.join('\n');
  }

  List<String> preprocessCode(List<String> code) {
    List<String> preprocessedCode = [];

    void addLine(String line) {
      if (stripWhiteSpaceOnRight(preprocessedCode.lastOrNull ?? '').endsWith('\\')) {
        preprocessedCode.last = '${stripWhiteSpaceOnRight(stripWhiteSpaceOnRight(preprocessedCode.last).substring(0, preprocessedCode.last.length -1))}${stripWhiteSpaceOnLeft(line)}';
        return;
      }

      preprocessedCode.add(line);
    }

    void addLines(List<String> lines) {
      for (String line in lines) {
        addLine(line);
      }
    }
    
    for (String line in code) {
      if (regex.emptyLine.hasMatch(line)
       || regex.comment.hasMatch(line)
      ) {
        continue;
      }
      
      if (regex.importLine.hasMatch(line)) {
        addLines(preprocessCode(readAndImportFile(
          regex.importLine
          .firstMatch(line)
          !.namedGroup('path')!
        )));

        continue;
    }

      addLine(line);
    }

    return preprocessedCode;
  }

  List<String> readAndImportFile(String filePath) {
    if (!filePath.endsWith('.gre')) {
      filePath += '.gre';
    }
    
    if (regex.externalImport.hasMatch(filePath)) {
      String module = regex.externalImport.firstMatch(filePath)!.namedGroup('path')!;
      String? modulePath;

      if (Directory(goreLangBuiltInsPath).listSync().map((e) => path.basenameWithoutExtension(e.path)).contains(module)) {
        modulePath = goreLangBuiltInsPath;
      }
      else if (Directory(goreLangInstalledPath).listSync().map((e) => path.basenameWithoutExtension(e.path)).contains(module)) {
        modulePath = goreLangInstalledPath;
      }

      if (modulePath == null) {
        terminal.error(
          'No installed or built in module with name $module found \n'
          'Try installing it or moving it to the directory of $goreLangInstalledPath \n'
          ''
        );
        throw MissingModule();
      }
      
      filePath = path.join(modulePath, module);
    } else if (paths.isNotEmpty) {
      filePath = path.join(path.dirname(paths.last), filePath);
    }

    filePath = path.absolute(filePath);

    if (!File(filePath).existsSync()) {
      terminal.error('No file found under directory $filePath');
      throw MissingFile();
    }

    paths.add(filePath);

    return File(filePath).readAsLinesSync();
  }

  Token preformattedToToken() {
    return TokenCodeBlock(
      tokenise(preprocessedCode)
    );
  }
}

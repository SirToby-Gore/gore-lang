import 'package:gore_lang/_common.dart';
import 'package:path/path.dart' as path;

final Terminal terminal = Terminal();

final String goreLangBasePath = () {
  const String langName = 'gore_lang';
  
  if (Platform.isWindows) {
    return 'C:\\Program Files x86\\$langName\\';
  } else {
    return '/usr/lib/$langName/';
  }
}();
final String goreLangBuiltInsPath = path.join(goreLangBasePath, 'modules', 'built_ins');
final String goreLangInstalledPath = path.join(goreLangBasePath, 'modules', 'installed');


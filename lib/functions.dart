String stripWhiteSpaceOnLeft(String text) {
  return RegExp(r'^\s*(?<text>.*)$').firstMatch(text)?.namedGroup('text') ?? '<no match>';
}

String stripWhiteSpaceOnRight(String text) {
  return RegExp(r'^(?<text>.*?)\s*$').firstMatch(text)?.namedGroup('text') ?? '<no match>';
}

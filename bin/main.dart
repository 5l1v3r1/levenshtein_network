import '../lib/social_words.dart';
import 'dart:io';

void main(List<String> args) {
  if (args.length != 3) {
    stderr.writeln('Usage: dart bin/main.dart <start word> '
        '<path to dictionary> <output file>');
    exit(1);
  }
  var startWord = args[0];
  var dictionary = args[1];
  var outputFile = args[2];
  new Search(dictionary, startWord).run().then((words) {
    return new File(outputFile).writeAsString(words.join('\n'));
  }).catchError((e) {
    stderr.writeln('Error: $e');
    exit(1);
  });
}

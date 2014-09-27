library social_words;

import 'dart:io';
import 'dart:async';

part 'src/levenshtein.dart';
part 'src/search.dart';
part 'src/levenshtein_dictionary.dart';

void main(List<String> args) {
  if (args.length != 2) {
    stderr.writeln('Usage: dart social_words.dart <start word> '
        '<path to dictionary>');
    exit(1);
  }
  var startWord = args[0];
  var dictionary = args[1];
  new Search(dictionary, startWord).run().then((words) {
    for (var word in words) {
      print(word);
    }
  });
}

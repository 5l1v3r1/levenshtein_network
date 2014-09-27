part of social_words;

class Search {
  final String dictionaryPath;
  final String startWord;
  
  LevenshteinDictionary remaining;
  List<String> socialNetwork = new List<String>();
  List<String> unexplored = new List<String>();
  
  Search(this.dictionaryPath, this.startWord);
  
  Future<Iterable<String>> run() {
    return new File(dictionaryPath).readAsLines().then((lines) {
      Map<int, int> lens = {};
      for (var line in lines) {
        if (lens[line.length] == null) {
          lens[line.length] = 1;
        } else {
          ++lens[line.length];
        }
      }
      remaining = new LevenshteinDictionary(lines);
      remaining.remove(startWord);
      unexplored.add(startWord);
      return exploreAll();
    });
  }
  
  Iterable<String> exploreAll() {
    while (unexplored.length > 0) {
      var next = unexplored.last;
      unexplored.removeAt(unexplored.length - 1);
      unexplored.addAll(remaining.findAndRemoveFriends(next));
      socialNetwork.add(next);
    }
    return socialNetwork;
  }
}

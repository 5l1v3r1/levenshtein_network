part of social_words;

List<String> findAndRemoveFriendsInList(String word, List<String> list) {
  var result = [];
  for (int i = 0; i < list.length; ++i) {
    var aWord = list[i];
    if (areWordsFriends(aWord, word)) {
      result.add(aWord);
      list[i] = list.last;
      list.removeAt(list.length - 1);
      --i;
    }
  }
  return result;
}

class LevenshteinDictionary {
  final Map<int, List<String>> wordMap = {};
  
  LevenshteinDictionary(Iterable<String> words) {
    for (var word in words) {
      if (wordMap[word.length] != null) {
        wordMap[word.length].add(word);
      } else {
        wordMap[word.length] = [word];
      }
    }
  }
  
  List<String> findAndRemoveFriends(String word) {
    var result = [];
    result.addAll(findAndRemoveFriendsInList(word,
        wordsForLength(word.length - 1)));
    result.addAll(findAndRemoveFriendsInList(word,
        wordsForLength(word.length)));
    result.addAll(findAndRemoveFriendsInList(word,
        wordsForLength(word.length + 1)));
    return result;
  }
  
  void remove(String word) {
    wordsForLength(word.length).remove(word);
  }
  
  List<String> wordsForLength(int len) {
    if (wordMap[len] == null) {
      return [];
    } else {
      return wordMap[len];
    }
  }
}

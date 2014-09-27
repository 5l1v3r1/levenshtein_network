part of social_words;

bool areWordsFriends(String w1, String w2) {
  String shorter = w1.length > w2.length ? w2 : w1;
  String longer = w1.length > w2.length ? w1 : w2;
  if (shorter.length + 1 < longer.length) {
    return false;
  } else if (shorter.length == longer.length) {
    // make sure there is exactly one difference
    bool foundDiff = false;
    for (int i = 0; i < w1.length; ++i) {
      if (w1.codeUnitAt(i) != w2.codeUnitAt(i)) {
        if (foundDiff) {
          return false;
        } else {
          foundDiff = true;
        }
      }
    }
    // words aren't friends if they're equal
    return foundDiff;
  } else {
    if (longer.startsWith(shorter)) {
      return true;
    }
    // attempt to make them equal with a single insertion
    for (int i = 0; i < shorter.length; ++i) {
      if (longer.codeUnitAt(i) != shorter.codeUnitAt(i)) {
        shorter = shorter.substring(0, i) + '${longer[i]}' +
            shorter.substring(i);
        break;
      }
    }
    return shorter == longer;
  }
}

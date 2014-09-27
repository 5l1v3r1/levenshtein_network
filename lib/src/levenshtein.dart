part of social_words;

bool areWordsFriends(String w1, String w2) {
  String shorter = w1.length > w2.length ? w2 : w1;
  String longer = w1.length > w2.length ? w1 : w2;
  if (shorter.length + 1 < longer.length) {
    return false;
  } else if (shorter.length == longer.length) {
    // make sure there is exactly one difference
    bool foundDiff = false;
    for (int i = 0; i < shorter.length; ++i) {
      if (shorter[i] != longer[i]) {
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
    int shorterIdx = 0;
    int longerIdx = 0;
    while (shorterIdx < shorter.length) {
      if (longer[longerIdx] != shorter[shorterIdx]) {
        if (shorterIdx != longerIdx) {
          return false;
        }
        ++longerIdx;
        continue;
      }
      ++longerIdx;
      ++shorterIdx;
    }
    return true;
  }
}

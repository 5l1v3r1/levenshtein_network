# Program architecture

The entire program was written in Dart. While it performs I/O asynchronously, it uses a blocking algorithm to find the solution.

The solution is found by searching a dictionary for all of the Levenshtein "friends" of a given word. Each friend is then added to a queue and removed from the dictionary. This process repeats until there are no words left on the queue.

# Benchmarks

Using [randomlist.txt](randomlist.txt), this program found the social network of the word "foo" in less than 3 seconds using a single core of an Intel Core i7 2.6 GHz.

On my system, the Dart task uses about 30MB of memory. This is not bad, considering that it loads 117982 words into memory and that the Dart VM uses about 10MB of memory for an empty program.

# Optimizations

My first implementation took about 40 minutes to write and was incredibly slow (took several minutes to complete). To address this, I created a LevenshteinDictionary class which uses the length of a word as a heuristic for Levenshtein distance.

It turns out that the length-based heuristic wasn't enough. The algorithm still took roughly 25 seconds to run. Finally, I decided to micro-optimize [levenshtein.dart](lib/src/levenshtein.dart) in this [commit](https://github.com/unixpickle/levenshtein_network/commit/9743bdac67f954a8d1bd1876ed61eb9d4f87ce2f). This optimization reduced the computation time by a factor of 8. I now suspect that `substring` and string concatenation are slow in the Dart VM.

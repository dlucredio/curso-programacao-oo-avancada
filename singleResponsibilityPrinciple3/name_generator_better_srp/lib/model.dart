import 'package:english_words/english_words.dart';

class WordModel {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};

  int numberOfSuggestions() => _suggestions.length;
  WordPair getSuggestion(int index) => _suggestions[index];

  void addMoreSuggestions() =>
      _suggestions.addAll(generateWordPairs().take(10));

  bool hasSavedPair(WordPair pair) => _saved.contains(pair);

  Set<WordPair> get savedSuggestions => _saved;

  void removeFromSaved(WordPair pair) => _saved.remove(pair);

  void addToSaved(WordPair pair) => _saved.add(pair);
}

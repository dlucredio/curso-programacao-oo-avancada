import 'package:english_words/english_words.dart';

void retrainModel(Set<WordPair> selected) {
  print("Retraining model...");
  selected.forEach((pair) => print("$pair is selected..."));
}

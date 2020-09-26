import 'package:english_words/english_words.dart';

import 'events.dart';

// Now we need a class for the Machine Learning model, to
// store the number of changes. Since we already have a class
// we might as well hold a reference to the set of selected
// word pairs. This doesn't increase coupling as retrainModel()
// already needed a reference for that anyway.
class MachineLearningModel {
  int changes = 0;
  Set<WordPair> selected;

  MachineLearningModel(this.selected);

  void subscribeToDomainEvents(DomainEvents<WordPair> wordPairSelected,
      DomainEvents<WordPair> wordPairRemoved) {
    // Now all the logic for the machine learning is confined
    // in this method.
    wordPairSelected.register((pair) {
      changes++;
      if (changes > 10) {
        changes = 0;
        retrainModel();
      }
    });
    wordPairRemoved.register((pair) {
      changes++;
      if (changes > 10) {
        changes = 0;
        retrainModel();
      }
    });
  }

  void retrainModel() {
    print("Retraining model...");
    selected.forEach((pair) => print("$pair is selected..."));
  }
}

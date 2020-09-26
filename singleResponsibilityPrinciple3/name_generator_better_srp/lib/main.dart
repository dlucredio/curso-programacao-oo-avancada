// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'model.dart' as Model;
import 'social.dart' as Social;
import 'learning.dart' as Learning;
import 'events.dart' as Events;

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
  // #enddocregion build
}
// #enddocregion MyApp

// #docregion RWS-var
class _RandomWordsState extends State<RandomWords> {
  final _model = Model.WordModel();
  final _biggerFont = TextStyle(fontSize: 18.0);

  // We add our domain events here.
  // See how there are no dependencies to specific side effects?
  // So far so good!
  final _pairSelectedEvents = Events.DomainEvents<WordPair>();
  final _pairRemovedEvents = Events.DomainEvents<WordPair>();

  // We added a reference to another class not related to
  // the UI here. Doesn't smell good and seems like we are
  // breaking the single responsibility principle.
  // But wait, there is more in the constructor below
  Learning.MachineLearningModel _machineLearningModel;

  // #enddocregion RWS-var

  _RandomWordsState() {
    // We now must register the domain event subscribers.
    // Here we are adding some dependency to other modules/classes
    // We are breaking the single responsibility principle,
    // but just a little! We are actually mostly delegating it to
    // other classes/modules

    // Delegating social media subscriptions to another module
    Social.subscribeToEvents(_pairSelectedEvents, _pairRemovedEvents);

    // Delegating machine learning subscriptions to another class
    _machineLearningModel =
        Learning.MachineLearningModel(_model.savedSuggestions);
    _machineLearningModel.subscribeToDomainEvents(
        _pairSelectedEvents, _pairRemovedEvents);

    // Done! Now all side effects are registered.
    // There is still a little coupling and the single responsibility
    // principle is being broken just a little. But this is confined
    // in this method and is mostly delegation.

    // If this still annoys you, you could do this elsewhere,
    // such as in the main app, in a config screen, etc. You could
    // inject these dependencies too.
  }

  // #docregion _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _model.numberOfSuggestions()) {
            _model.addMoreSuggestions(); /*4*/
          }
          return _buildRow(_model.getSuggestion(index));
        });
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _model.hasSavedPair(pair);
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          if (alreadySaved) {
            handleRemovePair(pair);
          } else {
            handleSavePair(pair);
          }
        });
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  // #enddocregion RWS-build

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _model.savedSuggestions.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, //...to here.
      ),
    );
  }

  void handleRemovePair(WordPair pair) {
    // Should we have to deal with setState here?
    // We could move this up! We could save two lines of code, yes!
    // But it is nice to keep setState together with the state being
    // setted, as is is more explicit in this way! It makes the
    // reader more assured that we are propely using Flutter's
    // state management flow
    setState(() => _model.removeFromSaved(pair));

    // All other side effects are now completely defined elsewhere
    _pairRemovedEvents.fire(pair);

    // See how this method now has only one responsibility?
    // Well, actually two: changing state and firing events
    // for all side effects.
    // But it is way better than before, because now this
    // method doesn't need to KNOW what these side effects are
  }

  void handleSavePair(WordPair pair) {
    // Should we have to deal with setState here?
    // We could move this up! We could save two lines of code, yes!
    // But it is nice to keep setState together with the state being
    // setted, as is is more explicit in this way! It makes the
    // reader more assured that we are propely using Flutter's
    // state management flow
    setState(() => _model.addToSaved(pair));

    // All other side effects are now completely defined elsewhere
    _pairSelectedEvents.fire(pair);

    // See how this method now has only one responsibility?
    // Well, actually two: changing state and firing events
    // for all side effects.
    // But it is way better than before, because now this
    // method doesn't need to KNOW what these side effects are
  }

  // #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

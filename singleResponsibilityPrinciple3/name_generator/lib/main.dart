// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'social.dart' as Social;
import 'learning.dart' as Learning;

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
  final _model = WordModel();
  final _biggerFont = TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var

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

  // This is for the Machine Learning logic
  int changes = 0;

  void handleRemovePair(WordPair pair) {
    // Should we have to deal with setState here?
    setState(() => _model.removeFromSaved(pair));

    // Social media code inside the main UI class??
    Social.shareFacebook(
        "Hello everyone, $pair is no longer one of my favorite word pairs!");
    Social.shareWhatsapp(
        "Hey, $pair is no longer one of my favorite word pairs!");
    Social.shareTwitter(
        "Just saying... $pair is no longer one of my favorite word pairs!");

    // MACHINE LEARNING CODE INSIDE THE MAIN UI CLASS???
    changes++;
    if (changes > 10) {
      changes = 0;
      Learning.retrainModel(_model.savedSuggestions);
    }
  }

  void handleSavePair(WordPair pair) {
    // Should we have to deal with setState here?
    setState(() => _model.addToSaved(pair));

    // Social media code inside the main UI class?
    Social.shareFacebook(
        "OMG, $pair just became one one of my favorite word pairs!");
    Social.shareWhatsapp("Hey, how cool is $pair?");
    Social.shareTwitter(
        "Just saying... $pair is one of my favorite word pairs!");

    // MACHINE LEARNING CODE INSIDE THE MAIN UI CLASS???
    changes++;
    if (changes > 10) {
      changes = 0;
      Learning.retrainModel(_model.savedSuggestions);
    }
  }

  // #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

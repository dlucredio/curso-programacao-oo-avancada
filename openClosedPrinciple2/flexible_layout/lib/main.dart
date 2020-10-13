import 'dart:math';

import 'package:flexible_layout/layoutStrategies.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flexible layout Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(ExpandToMaxWidthStrategy());
}

class Component {
  final double minWidth, maxWidth;
  final String content;
  Component(this.minWidth, this.maxWidth, this.content);
}

abstract class LayoutStrategy {
  void compose(List<Component> components, double lineSize,
      List<int> lineBreaks, List<double> componentWidths);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Component> _components = List<Component>();
  LayoutStrategy _strategy;

  _MyHomePageState(this._strategy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _buildContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContent,
        tooltip: 'Add new component',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addContent() {
    var r = Random();
    setState(() {
      _components.add(Component(r.nextDouble() * 100 + 100,
          r.nextDouble() * 100 + 300, lipsum.createSentence()));
    });
  }

  ListView _buildContent() {
    var rows = List<List<Widget>>();
    var lineBreaks = List<int>();
    var componentWidths = List<double>();
    _strategy.compose(_components, MediaQuery.of(context).size.width,
        lineBreaks, componentWidths);

    var row = List<Widget>();
    var i = 0;
    for (var component in _components) {
      row.add(
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Text(component.content),
          width: componentWidths[i] - 20,
        ),
      );
      i++;
      if (lineBreaks.contains(i)) {
        rows.add(row);
        row = List<Widget>();
      }
    }
    rows.add(row);

    return ListView(children: List.of(rows.map((r) => Row(children: r))));
  }
}

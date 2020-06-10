import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(primaryColor: Colors.blueGrey),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomwords = <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, item) {
        if (item.isOdd)
          return Divider(
            color: Colors.white,
          );
        final index = item ~/ 2;
        if (index >= randomwords.length) {
          randomwords.addAll(generateWordPairs().take(10));
        }
        return Container(
          height: 50,
          color: Colors.white,
          child: Center(child: Text('${randomwords[index]}')),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: _buildList());
  }
}

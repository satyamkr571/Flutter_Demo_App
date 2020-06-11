import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomwords = <WordPair>[];
  //final  savedwords = Set<WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, item) {
        if (item.isOdd)
          return Divider(
            color: Colors.grey,
          );
        final index = item ~/ 2;
        if (index >= randomwords.length) {
          randomwords.addAll(generateWordPairs().take(10));
        }
        // return Container(
        //   height: 50,
        //   color: Colors.white,
        //   child: Text(
        //     '  ${randomwords[index]}',
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black, letterSpacing: 1, height: 2),
        //   ),
        // );
        return buildRow(randomwords[index]);
      },
    );
  }
  Widget buildRow(WordPair pair){
    return ListTile(
      title: Text(pair.asPascalCase,style: TextStyle(
                 fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black, letterSpacing: 1, height: 2)
                 )
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

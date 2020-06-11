import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomwords = <WordPair>[];
  final savedwords = Set<WordPair>();

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

  Widget buildRow(WordPair pair) {
    final alreadysavedwords = savedwords.contains(pair);
    return ListTile(
        title: Text(pair.asUpperCase,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1,
                height: 2)),
        trailing: Icon(
            alreadysavedwords ? Icons.favorite : Icons.favorite_border,
            color: alreadysavedwords ? Colors.red : null),
        onTap: () {
          setState(() {
            if (alreadysavedwords) {
              savedwords.remove(pair);
            } else {
              savedwords.add(pair);
            }
          });
        });
  }

  void pushtosave() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> wordtiles = savedwords.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asUpperCase,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 1,
                    height: 2)));
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: wordtiles,
        color: Colors.grey,
      ).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Words'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: pushtosave,
            )
          ],
        ),
        body: _buildList());
  }
}

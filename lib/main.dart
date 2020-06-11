import 'package:flutter/material.dart';
import './wordslist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(primaryColor: Colors.green),
        home: RandomWords());
  }
}

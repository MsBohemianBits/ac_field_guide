import 'package:flutter/material.dart';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AC Field Guide',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: IndexPage(title: 'AC Field Guide'),
    );
  }
}

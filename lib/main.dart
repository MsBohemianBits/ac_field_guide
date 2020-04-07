import 'package:flutter/material.dart';

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

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Animal_Crossing_Logo.png')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add stuff',
        child: Icon(Icons.add),
      ),
    );
  }
}

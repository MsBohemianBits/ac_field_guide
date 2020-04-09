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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Add reminder',
            onPressed: () {
              /** **/
            },
          ),
        ],
      ),
      body: CustomScrollView(
        semanticChildCount: 4,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Upcoming events'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 70.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index > 3) return null;
                return Card(
                  color: Colors.white,
                  elevation: 0.0,
                  child: ListTile(
                    leading: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 1.0,
                          child: Container(
                            height: 50,
                            width: 20,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                    title: Text(
                      "Fishing Tournament",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Saturday, April 11th, 2020"),

                  ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

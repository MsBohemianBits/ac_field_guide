import 'package:flutter/material.dart';
import '../modal/events.dart';
import '../widgets/events.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: New Horizons',
      style: optionStyle,
    ),
    Text(
      'Index 1: Pocket Camp',
      style: optionStyle,
    ),
    Text(
      'Index 2: New Leaf',
      style: optionStyle,
    ),
    Text(
      'Index 2: City Folk',
      style: optionStyle,
    ),
    Text(
      'Index 2: Wild World',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    // Build widget listing.
    List<Widget> widgets = List<Widget>();
    events.forEach((k, v) => {
      {
        widgets.add(EventsListing(
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.pink),
            ),
            eventTitle: k.toString(),
            eventDateTime: v,
            eventCategory: 'General'
        ))
      }
    });

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            title: Text('New Horizons'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share),
            title: Text('Pocket Camp'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks),
            title: Text('New Leaf'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            title: Text('City Folk'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Wild World'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      body: CustomScrollView(
        semanticChildCount: events.length,
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
            delegate: SliverChildListDelegate(widgets),
          ),
        ],
      ),
    );
  }
}
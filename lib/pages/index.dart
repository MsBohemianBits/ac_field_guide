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
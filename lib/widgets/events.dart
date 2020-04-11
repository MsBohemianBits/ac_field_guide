import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class EventsListing extends StatelessWidget {
  EventsListing({
    Key key,
    this.thumbnail,
    this.eventTitle,
    this.eventDateTime,
    this.eventCategory,
  }) : super(key: key);

  final Widget thumbnail;
  final String eventTitle;
  final String eventDateTime;
  final String eventCategory;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: ListTile(
        leading: Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                final Event event = Event(
                  title: 'Event title',
                  description: 'Event description',
                  location: 'Event location',
                  startDate: DateTime.parse(eventDateTime),
                  endDate: DateTime.parse(eventDateTime),
                );
                Add2Calendar.addEvent2Cal(event);
              },
              child:  CircleAvatar(
                radius: 30,
              ),
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
          eventTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateTime.parse(eventDateTime).toString()),
      ),
    );
  }
}

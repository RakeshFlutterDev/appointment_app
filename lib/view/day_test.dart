import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class CalendarPage extends StatelessWidget {
  final List<Event> events = [
    Event('Meeting', DateTime(2023, 5, 20, 10, 0), Colors.orange),
    Event('Lunch', DateTime(2023, 5, 20, 13, 0), Colors.green),
    Event('Workshop', DateTime(2023, 5, 20, 15, 30), Colors.blue),
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    final DateFormat monthFormat = DateFormat('MMMM yyyy');
    final String headerText = monthFormat.format(events[0].time);

    return Scaffold(
      appBar: AppBar(
        title: Text('Day Calendar'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              headerText,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                final timeFormat = TimeOfDay.fromDateTime(event.time).format(context);
                final dateFormat = event.time.day.toString();
                final monthFormat = event.time.month.toString();

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: event.color,
                  ),
                  title: Text(event.title),
                  subtitle: Text('Date: $monthFormat/$dateFormat \nTime: $timeFormat'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime time;
  final Color color;

  Event(this.title, this.time, this.color);
}

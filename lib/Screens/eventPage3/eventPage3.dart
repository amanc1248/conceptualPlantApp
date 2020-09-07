// import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/Time_And_Duration.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/calendar_and_events.dart';
import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// import 'local_widgets/Particular_Date_Event.dart';

class EventPage3 extends StatefulWidget {
  @override
  _EventPage3State createState() => _EventPage3State();
}

class _EventPage3State extends State<EventPage3> {
  // CalendarController _controller;
  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(child: HomePage()),
            ],
          ),
        ),
      ),
    );
  }
}

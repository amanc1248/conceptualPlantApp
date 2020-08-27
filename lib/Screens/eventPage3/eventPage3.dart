// import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/Time_And_Duration.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/calendar_and_events.dart';
import 'package:conceptualschoolapp/widgets/Upper_AppBar.dart';
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
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                child: UpperAppBar(
                    leftIcon: Icons.calendar_today,
                    middleText: "January 2020",
                    rightText: "Today"),
              ),
              Expanded(
                child: Container(
                  child: HomePage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TableCalendar(
//                     calendarController: _controller,
//                     initialCalendarFormat: CalendarFormat.month,
//                     calendarStyle: CalendarStyle(
//                       todayColor: Colors.white,
//                     ),
//                     builders: CalendarBuilders(
//                       todayDayBuilder: (context, date, events) {
//                         return Container(
//                           margin: EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(12),
//                               ),
//                               color: Colors.lightBlueAccent),
//                           child: Center(
//                             child: Text(
//                               date.day.toString(),
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         );
//                       },
//                       selectedDayBuilder: (context, date, events) {
//                         return Container(
//                           margin: EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(12),
//                               ),
//                               color: Color(0xFF334192)),
//                           child: Center(
//                             child: Text(
//                               date.day.toString(),
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         );
//                       },
//                     )),

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class OurConceptualCalendar extends StatefulWidget {
  @override
  _OurConceptualCalendarState createState() => _OurConceptualCalendarState();
}

class _OurConceptualCalendarState extends State<OurConceptualCalendar> {
  CalendarController _controller;

    @override
    void initState() {
    super.initState();
    _controller = CalendarController();
    _events = {};
  }
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        events: _events;
        calendarController: _controller,
        rowHeight: 40,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          formatButtonShowsNext: false,
        ),
        calendarStyle: CalendarStyle(
          contentPadding: EdgeInsets.all(0),    
        ),
        daysOfWeekStyle:
            DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.grey)),
        builders: CalendarBuilders(
          //! for customizing the today date
          todayDayBuilder: (context, date, events) => Container(
            margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(date.day.toString(),
                    style: TextStyle(color: Colors.white))),
          ),
          //! for customizing the selected date
          selectedDayBuilder: (context, date, events) => Container(
              margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF334192)),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }
}

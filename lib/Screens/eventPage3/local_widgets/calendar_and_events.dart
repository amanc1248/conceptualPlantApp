import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/Particular_Date_Event.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/eventclass.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  CalendarController _controller;

  //!this list is created for showing the events
  List<EventStore> _selectedEvents;
  TextEditingController _lectureLevelController;
  TextEditingController _subjectNameController;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _lectureLevelController = TextEditingController();
    _subjectNameController = TextEditingController();
    _selectedEvents = [];
  }

  EventModifier eventModifierProvider;
  @override
  Widget build(BuildContext context) {
    eventModifierProvider = Provider.of<EventModifier>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: eventModifierProvider.events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
              //  eventModifierProvider.events;
                  setState(() {
                    _selectedEvents = events.cast<EventStore>();
                  });
             },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            GestureDetector(
              onTap: () {
                _showAddDialog();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFF334192),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Center(
                      child: Text("Add Event",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600))),
                ),
              ),
            ),
            ..._selectedEvents.map((EventStore) {
              return ParticularDateEvent(
                lectureSubject: EventStore.subject.toString(),
                lectureStandard: EventStore.level.toString(),
              );
            }),
          ],
        ),
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                children: [
                  TextField(
                    controller: _subjectNameController,
                  ),
                  TextField(
                    controller: _lectureLevelController,
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    var theControllerMethod = _controller.selectedDay;
                    if (_lectureLevelController.text.isEmpty ||
                        _subjectNameController.text.isEmpty) return;
                    //! if there is already an events in the selected day. Then add the text from the textfield
                    if (eventModifierProvider.events[_controller.selectedDay] !=
                        null) {
                      eventModifierProvider.addingEventsToList(
                          lectureLevel: _lectureLevelController,
                          subjectName: _subjectNameController,
                          controller: theControllerMethod);
                    }
                    //! if there is no events in the selected day, simply give the text to the events.
                    else {
                      eventModifierProvider.showingTheEvent(
                          lectureLevel: _lectureLevelController,
                          subjectName: _subjectNameController,
                          controller: theControllerMethod);
                    }
                  //  eventModifierProvider.settingTheValue(
                  //    controller: theControllerMethod,
                  //    selectedEvents: _selectedEvents
                  //  );
                    setState(() {
                      _selectedEvents =
                          eventModifierProvider.events[_controller.selectedDay];
                    });
                    _subjectNameController.clear();
                    _lectureLevelController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'One';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: Icon(Icons.arrow_downward),
//       iconSize: 24,
//       elevation: 16,
//       style: TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String newValue) {
//         setState(() {
//           dropdownValue = newValue;
//         });
//       },
//       items: <String>['One', 'Two', 'Free', 'Four']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

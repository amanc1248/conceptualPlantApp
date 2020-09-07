import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/Particular_Date_Event.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/Time_And_Duration.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/dropdown_classes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  //!this list is created for showing the events
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  int e = 0;
  EventModifier eventModifierProvider;
  Subject selectedSubject;
  List<Subject> subjects = <Subject>[
    Subject('Mathematics'),
    Subject('Science'),
    Subject("Health"),
    Subject("Programming"),
    Subject("Thermodynamics")
  ];

  Level selectedLevel;
  List<Level> levels = <Level>[
    Level('Standard'),
    Level('Medium'),
    Level("High"),
    Level("Risky")
  ];

  Room selectedRoom;
  List<Room> rooms = <Room>[
    Room('Room 120, Block A'),
    Room('Room 120, Block B'),
    Room('Room 120, Block C'),
    Room('Room 120, Block D'),
    Room('Room 120, Block E'),
    Room('Room 120, Block F')
  ];
  String theFormatedDate;
  findingTheTime() {
    List theConvertedKeysList =
        eventModifierProvider.events.keys.toList(); //keys list
    for (int i = 0; i < theConvertedKeysList.length; i++) {
      for (int j = 0;
          j < eventModifierProvider.events[theConvertedKeysList[i]].length;
          j++) {
        for (int k = 0; k < 3; k++) {
          if (eventModifierProvider
                      .events[theConvertedKeysList[i]][j].subject ==
                  subjects[k].toString() &&
              eventModifierProvider.events[theConvertedKeysList[i]][j].level ==
                  levels[k].toString() &&
              eventModifierProvider.events[theConvertedKeysList[i]][j].room ==
                  rooms[k].toString()) {
            return "09:50";
          } else {
            return "10:40";
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    eventModifierProvider = Provider.of<EventModifier>(context, listen: false);

    return Consumer<EventModifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xFFF4F5F6),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: TableCalendar(
                          rowHeight: 45.0,
                          daysOfWeekStyle: DaysOfWeekStyle(
                              dowTextBuilder: (date, locale) =>
                                  DateFormat.E(locale).format(date)[0],
                              weekdayStyle: TextStyle(color: Colors.grey),
                              weekendStyle: TextStyle(color: Colors.grey)),
                          events: eventModifierProvider.events,
                          initialCalendarFormat: CalendarFormat.month,
                          calendarStyle: CalendarStyle(
                              markersColor: Colors.transparent,
                              outsideStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              outsideWeekendStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              weekdayStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              weekendStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                              canEventMarkersOverflow: true,
                              todayStyle: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                  color: Colors.white)),
                          headerStyle: HeaderStyle(
                            headerMargin: EdgeInsets.only(bottom: 16),
                            leftChevronIcon: Icon(
                              Icons.calendar_today,
                              color: Color(0xFF334192),
                              size: 35,
                            ),
                            decoration: BoxDecoration(color: Color(0xFFF4F5F6)),
                            titleTextStyle:
                                TextStyle(fontSize: 25, fontFamily: "Poppins"),
                            formatButtonVisible: false,
                            centerHeaderTitle: true,
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            formatButtonTextStyle:
                                TextStyle(color: Colors.white),
                            formatButtonShowsNext: false,
                          ),
                          startingDayOfWeek: StartingDayOfWeek.sunday,
                          onDaySelected: (day, events) {
                            eventModifierProvider.whenSelectedDay(
                                event: events);
                          },
                          builders: CalendarBuilders(
                            selectedDayBuilder: (context, date, events) =>
                                Container(
                                    margin: const EdgeInsets.all(4.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF334192),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(color: Colors.white),
                                    )),
                            todayDayBuilder: (context, date, events) =>
                                Container(
                                    margin: const EdgeInsets.all(4.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF334192),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(color: Colors.white),
                                    )),
                          ),
                          calendarController: _controller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: GestureDetector(
                          onTap: () {
                            eventModifierProvider.addShowContainer = true;
                          },
                          dragStartBehavior: DragStartBehavior.start,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xFF334192),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Center(
                                  child: Text("Add Event",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600))),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: eventModifierProvider.addShowContainer,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 4)),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                DropdownButton<Subject>(
                                  value: selectedSubject,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  hint: Container(
                                    width: 200,
                                    child: Text("Choose your subject",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (Subject newValue) {
                                    setState(() {
                                      selectedSubject = newValue;
                                    });
                                  },
                                  items: subjects
                                      .map<DropdownMenuItem<Subject>>(
                                          (Subject value) {
                                    return DropdownMenuItem<Subject>(
                                      value: value,
                                      child: Text(value.subject),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<Level>(
                                  value: selectedLevel,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  hint: Container(
                                    width: 200,
                                    child: Text("Choose Level:",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (Level newValue) {
                                    setState(() {
                                      selectedLevel = newValue;
                                    });
                                  },
                                  items: levels.map<DropdownMenuItem<Level>>(
                                      (Level value) {
                                    return DropdownMenuItem<Level>(
                                      value: value,
                                      child: Text(value.level),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<Room>(
                                  value: selectedRoom,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  hint: Container(
                                    width: 200,
                                    child: Text("Choose Room No.",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (Room newValue) {
                                    setState(() {
                                      selectedRoom = newValue;
                                    });
                                  },
                                  items: rooms.map<DropdownMenuItem<Room>>(
                                      (Room value) {
                                    return DropdownMenuItem<Room>(
                                      value: value,
                                      child: Text(value.room),
                                    );
                                  }).toList(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FlatButton(
                                      child: Text("Save"),
                                      onPressed: () {
                                        var theControllerMethod =
                                            _controller.selectedDay;
                                        if (selectedLevel == null ||
                                            selectedRoom == null ||
                                            selectedSubject == null) {
                                          selectedLevel = null;
                                          selectedSubject = null;
                                          selectedRoom = null;
                                          print("The box are empty!");
                                          eventModifierProvider
                                              .addShowContainer = false;
                                        } else {
                                          //! if there is already an events in the selected day. Then add the text from the textfield
                                          if (eventModifierProvider.events[
                                                  _controller.selectedDay] !=
                                              null) {
                                            eventModifierProvider
                                                .addingEventsToList(
                                                    lectureLevel:
                                                        selectedLevel.level,
                                                    subjectName:
                                                        selectedSubject.subject,
                                                    roomNo: selectedRoom.room,
                                                    controller:
                                                        theControllerMethod);
                                          }
                                          //! if there is no events in the selected day, simply give the text to the events.
                                          else {
                                            eventModifierProvider
                                                .showingTheEvent(
                                                    lectureLevel:
                                                        selectedLevel.level,
                                                    subjectName:
                                                        selectedSubject.subject,
                                                    roomNo: selectedRoom.room,
                                                    controller:
                                                        theControllerMethod);
                                          }
                                          eventModifierProvider.settingTheValue(
                                              controller: theControllerMethod);
                                          selectedLevel = null;
                                          selectedSubject = null;
                                          selectedRoom = null;
                                          eventModifierProvider
                                              .addShowContainer = false;
                                          eventModifierProvider
                                              .showTodaysEventlist();
                                        }
                                      },
                                    ),
                                    FlatButton(
                                        onPressed: () {
                                          selectedLevel = null;
                                          selectedSubject = null;
                                          selectedRoom = null;
                                          eventModifierProvider
                                              .addShowContainer = false;
                                          eventModifierProvider
                                              .showTodaysEventlist();
                                        },
                                        child: Text("Cancel"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ...eventModifierProvider.selectedEvents.map((EventStore) {
                        int index = eventModifierProvider.selectedEvents
                            .indexOf(EventStore);

                        return Dismissible(
                          key: Key(index.toString()),
                          onDismissed: (direction) {
                            eventModifierProvider.selectedEvents
                                .removeAt(index);
                          },
                          background: Container(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                  "Slide To Remove",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Poppins",
                                      color: Colors.black),
                                ),
                              ),
                              decoration:
                                  BoxDecoration(color: Color(0xFFF4F5F6))),
                          child: Column(
                            children: [
                              TimeAndDuration(
                                time: findingTheTime(),
                                amPm: "AM",
                                duration: "1 Hour 3 min",
                              ),
                              ParticularDateEvent(
                                lectureSubject: EventStore.subject.toString(),
                                lectureStandard: EventStore.level.toString(),
                                lectureRoom: EventStore.room.toString(),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

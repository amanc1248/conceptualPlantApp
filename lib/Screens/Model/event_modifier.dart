import 'package:conceptualschoolapp/Screens/Model/chart_details.dart';
import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/eventclass.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/deliveries_list.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/todays_Event_List.dart';
import 'package:conceptualschoolapp/widgets/Upper_AppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class EventModifier extends ChangeNotifier {
  Map<DateTime, List<EventStore>> _events = {};

  List<ChartDetails> _data = [
    // ChartDetails(day: "Sun", eventNumber: 21),
    // ChartDetails(day: "Mon", eventNumber: 2),
    // ChartDetails(day: "Tue", eventNumber: 23),
    // ChartDetails(day: "Wed", eventNumber: 7),
    // ChartDetails(day: "Thu", eventNumber: 4),
    // ChartDetails(day: "Fri", eventNumber: 3),
    // ChartDetails(day: "Sat", eventNumber: 23),
  ];
  List<ChartDetails> get data => _data;
  set data(List<ChartDetails> val) {
    _data = val;
    notifyListeners();
  }

  List<EventStore> _selectedEvents = [];
  int _selectedDaysItem = 1;
  int get selectedDaysItem => _selectedDaysItem;
  set selectedDaysItem(int val) {
    _selectedDaysItem = val;
    notifyListeners();
  }

  String _theText="Monthly";
  String get theText=> _theText;
  set theText(String val){
    _theText=val;
    notifyListeners();
  }
  int _todaysEventnumber = 0;
  int _exceptTodaysEventNumber = 0;
  Map<DateTime, List<EventStore>> get events => _events;
  List<EventStore> get selectedEvents => _selectedEvents;
  int get todaysEventnumber => _todaysEventnumber;
  List<dynamic> _blueSelectedDays = [];
  List<dynamic> get blueSelectedDays => _blueSelectedDays;
  List<dynamic> _theSelectedIndex = [1, 2, 3, 4];
  List<dynamic> get theSelectedIndex => _theSelectedIndex;
  set theSelectedIndex(List<dynamic> val) {
    _theSelectedIndex = val;
    notifyListeners();
  }

  set blueSelectedDays(List<dynamic> val) {
    _blueSelectedDays = val;
    notifyListeners();
  }

  set todaysEventnumber(int val) {
    _todaysEventnumber = val;
    notifyListeners();
  }

  int get exceptTodaysEventNumber => _exceptTodaysEventNumber;
  set exceptTodaysEventNumber(int val) {
    _exceptTodaysEventNumber = val;
    notifyListeners();
  }

  bool _addShowContainer = false; //for showing&hiding the container.
  bool get addShowContainer => _addShowContainer;
  set addShowContainer(bool val) {
    _addShowContainer = val;
    notifyListeners();
  }

  set selectedEvents(List<EventStore> val) {
    _selectedEvents = val;
    notifyListeners();
  }

  set events(Map<DateTime, List<EventStore>> val) {
    _events = val;
    notifyListeners();
  }

  addingEventsToList({lectureLevel, subjectName, roomNo, controller}) {
    events[controller].add(
      EventStore(
          subject: subjectName.toString(),
          level: lectureLevel.toString(),
          room: roomNo.toString()),
    );
    notifyListeners();
  }

  showingTheEvent({lectureLevel, subjectName, roomNo, controller}) {
    events[controller] = [
      EventStore(
          subject: subjectName.toString(),
          level: lectureLevel.toString(),
          room: roomNo.toString())
    ];
    notifyListeners();
  }

  settingTheValue({controller}) {
    selectedEvents = events[controller];
    notifyListeners();
  }

  whenSelectedDay({event}) {
    selectedEvents = event.cast<EventStore>();
    notifyListeners();
  }

  withAndWithoutTodaysDate() {
    List<Widget> withoutTheTodayDate = [];
    String calendarFormattedDate;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    List theConvertedKeysList = events.keys.toList(); //keys list
    for (int i = 0; i < theConvertedKeysList.length; i++) {
      calendarFormattedDate =
          DateFormat('yyyy-MM-dd').format(theConvertedKeysList[i]);
      if (calendarFormattedDate != formattedDate) {
        for (int j = 0; j < events[theConvertedKeysList[i]].length; j++) {
          withoutTheTodayDate.add(DeliveriesList(
            theDaysLeft: theConvertedKeysList[i].difference(now).inDays,
            roomNo: events[theConvertedKeysList[i]][j].room,
            subjectName: events[theConvertedKeysList[i]][j].subject,
          ));
        }

        // return eventModifierProvider.withoutTheTodayDate;
      } else {
        Container(
          child: Text("There is no any events"),
        );
      }
    }
    return withoutTheTodayDate;
  }

  showTodaysEventlist() {
    List<Widget> listViewContainer = [];
    String calendarFormattedDate;
    DateTime now = DateTime.now();
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(now); //this is todays date
    List theConvertedKeysList = events.keys.toList(); //keys list
    for (int i = 0; i < theConvertedKeysList.length; i++) {
      calendarFormattedDate =
          DateFormat('yyyy-MM-dd').format(theConvertedKeysList[i]);
      if (calendarFormattedDate == formattedDate) {
        for (int j = 0; j < events[theConvertedKeysList[i]].length; j++) {
          listViewContainer.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodaysEventLists(
              subjectName: events[theConvertedKeysList[i]][j].subject,
              roomName: events[theConvertedKeysList[i]][j].room,
            ),
          ));
        }
      } else {
        Container(
          child: Text("There is no any events"),
        );
      }
    }
    return listViewContainer;
  }

  showingAllTheEvents() {
    List<Widget> allTheEventsStoredContainer = [];
//this is todays date
    List theConvertedKeysList = events.keys.toList(); //keys list
    for (int i = 0; i < theConvertedKeysList.length; i++) {
      for (int j = 0; j < events[theConvertedKeysList[i]].length; j++) {
        allTheEventsStoredContainer.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: TodaysEventLists(
            subjectName: events[theConvertedKeysList[i]][j].subject,
            roomName: events[theConvertedKeysList[i]][j].room,
          ),
        ));
      }
    }
    return allTheEventsStoredContainer;
  }

  removingItem(int index) {
    events.remove(index);
    notifyListeners();
  }

  addingTheSelectedDays({List<dynamic> ourDays, int i}) {
    blueSelectedDays.add(ourDays[i]);
    notifyListeners();
  }

  bool _pattern = true;
  bool get pattern => _pattern;
  set pattern(bool val) {
    _pattern = val;
    notifyListeners();
  }



  tooglingTheMonthAndWeek() {
    if (pattern == true) {
      pattern = false;
      theText= "Monthly";
      return addingChartBarDataMonthly();
    } else {
      theText = "Weekly";
      pattern = true;
      return addingChartBarDataWeekly();
    }
  }

  addingChartBarDataMonthly() {
    DateTime now = DateTime.now();
    String currentMonth =
        DateFormat('M').format(now); //this is the current month.
    print(blueSelectedDays);
    print("The Initial data of dataChart is " + data.length.toString());
    List theConvertedKeysList = events.keys.toList(); //keys list
    data = [];

    //!place for events
    for (int sD = 0; sD < blueSelectedDays.length; sD++) {
      int specificDayEventNumber = 0;
      for (int cMN = 0; cMN < theConvertedKeysList.length; cMN++) {
        if ((blueSelectedDays[sD] ==
                DateFormat('EEEE').format(theConvertedKeysList[cMN])) &&
            (currentMonth ==
                DateFormat('M').format(theConvertedKeysList[cMN]))) {
          specificDayEventNumber += events[theConvertedKeysList[cMN]].length;
        }
      }
      data.add(ChartDetails(
          day: blueSelectedDays[sD].substring(0, 3),
          eventNumber: specificDayEventNumber));
    }
    print("The final data of the chart is " + data.length.toString());
  }

  addingChartBarDataWeekly() {
    data = [];
    DateTime now = DateTime.now();
    print(blueSelectedDays);
    print("The Initial data of dataChart is " + data.length.toString());
    List theConvertedKeysList = events.keys.toList(); //keys list
    int weekNumberOfCurrentDate(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      return ((dayOfYear - date.weekday + 10) / 7).floor();
    }

    //!place for events
    for (int sD = 0; sD < blueSelectedDays.length; sD++) {
      int specificDayEventNumber = 0;
      for (int cMN = 0; cMN < theConvertedKeysList.length; cMN++) {
        if ((blueSelectedDays[sD] ==
                DateFormat('EEEE').format(theConvertedKeysList[cMN])) &&
            (weekNumberOfCurrentDate(now) ==
                weekNumberOfCurrentDate(theConvertedKeysList[cMN]))) {
          specificDayEventNumber += events[theConvertedKeysList[cMN]].length;
        }
      }
      data.add(ChartDetails(
          day: blueSelectedDays[sD].substring(0, 3),
          eventNumber: specificDayEventNumber));
    }
    print("The final data of the chart is " + data.length.toString());
  }
}

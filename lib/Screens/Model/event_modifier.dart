import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/eventclass.dart';
import 'package:flutter/cupertino.dart';

class EventModifier extends ChangeNotifier {
  Map<DateTime, List<EventStore>> _events ={};
  Map<DateTime, List<EventStore>> get events => _events;

  set events(Map<DateTime, List<EventStore>> val) {
    _events = val;
    notifyListeners();
  }

  addingEventsToList({lectureLevel, subjectName, controller}) {
    notifyListeners();
    return events[controller]
        .add(EventStore(subject: subjectName.text, level: lectureLevel.text));
  }

  showingTheEvent({lectureLevel, subjectName, controller}) {
    events[controller] = [
      EventStore(subject: subjectName.text, level: lectureLevel.text)
    ];
    notifyListeners();
  }
  // settingTheValue({selectedEvents,controller}){
  //   selectedEvents =events[controller];
  //   notifyListeners();
  // }
  // whenSelectedDay({selectedEvents}){
  //   selectedEvents = events.cast<EventStore>();
  //   notifyListeners();
  // }
}

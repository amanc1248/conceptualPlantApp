import 'package:conceptualschoolapp/Screens/eventPage3/local_widgets/eventclass.dart';
import 'package:flutter/cupertino.dart';

class EventModifier extends ChangeNotifier {
  Map<DateTime, List<EventStore>> _events ={};
  List<EventStore> _selectedEvents =[];

  List<EventStore> get selectedEvents  =>_selectedEvents;

  Map<DateTime, List<EventStore>> get events => _events;

set selectedEvents(List<EventStore> val) {
    _selectedEvents = val;
    notifyListeners();
  }

  set events(Map<DateTime, List<EventStore>> val) {
    _events = val;
    notifyListeners();
  }

  addingEventsToList({lectureLevel, subjectName, controller}) {
     events[controller]
        .add(EventStore(subject: subjectName.text, level: lectureLevel.text));
    notifyListeners();
  }

  showingTheEvent({lectureLevel, subjectName, controller}) {
    events[controller] = [
      EventStore(subject: subjectName.text, level: lectureLevel.text)
    ];
    notifyListeners();
  }
  settingTheValue({controller}){
    selectedEvents =events[controller];
    notifyListeners();
  }
  whenSelectedDay({event}){
    selectedEvents = event.cast<EventStore>();
    notifyListeners();
  }
}

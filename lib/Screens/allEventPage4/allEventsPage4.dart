import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/todays_Event_List.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AllEventPage extends StatefulWidget {
  @override
  _AllEventPageState createState() => _AllEventPageState();
}

class _AllEventPageState extends State<AllEventPage> {
  var eventModifierProvider;
  weeklyEvents() {
    List<Widget> weeklyEvents = [];
    List theConvertedKeysList =
        eventModifierProvider.events.keys.toList(); //keys list

    DateTime now = DateTime.now();
    int weekNumber(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      return ((dayOfYear - date.weekday + 10) / 7).floor();
    }

    for (int i = 0; i < theConvertedKeysList.length; i++) {
      int weekNumberForEvents(DateTime date) {
        int dayOfYear = int.parse(DateFormat("D").format(date));
        return ((dayOfYear - date.weekday + 10) / 7).floor();
      }

      if (weekNumber(now) == weekNumberForEvents(theConvertedKeysList[i])) {
        for(int j=0;j<eventModifierProvider.events[theConvertedKeysList[i]].length;j++){
          weeklyEvents.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodaysEventLists(
              subjectName: eventModifierProvider.events[theConvertedKeysList[i]][j].subject,
              roomName: eventModifierProvider.events[theConvertedKeysList[i]][j].room,
            ),
          ));
        }
      }
      
    }
    return weeklyEvents;
  }

  @override
  Widget build(BuildContext context) {
    eventModifierProvider = Provider.of<EventModifier>(context, listen: false);

    return Consumer<EventModifier>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFF4F5F6),
              bottom: TabBar(
                labelColor: Color(0xFF334192),
                labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w700,fontFamily: "Poppins"),
                indicatorColor: Color(0xFF334192),
                tabs: [

                  Tab(
                    text: "Daily",

                  ),
                  Tab(text: "Weekly"),
                ],
              ),
              title: Text(
                "All Events",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,color:Colors.black,fontFamily: "Poppins"
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.only(top:10),
              color: Colors.white,
              child: TabBarView(              
                children: [
                  Center(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: eventModifierProvider.showingAllTheEvents(),
                  )),
                  Center(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: weeklyEvents(),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

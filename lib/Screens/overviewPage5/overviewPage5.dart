import 'package:conceptualschoolapp/Screens/Model/chart_details.dart';
import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/Screens/overviewPage5/local_widgets/event_chart.dart';
import 'package:conceptualschoolapp/constants.dart';
import 'package:conceptualschoolapp/widgets/Upper_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  List<dynamic> ourDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  curvingTheContainerCorner(index) {
    if (index == eventModifierProvider.theSelectedIndex[0]) {
      return BorderRadius.only(
          topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));
    }
    if (index == eventModifierProvider.theSelectedIndex[3]) {
      return BorderRadius.only(
          topRight: Radius.circular(12), bottomRight: Radius.circular(12));
    } else {
      return BorderRadius.only(
          topLeft: Radius.circular(0), bottomLeft: Radius.circular(0));
    }
  }

  showingTheSelectedDays() {
    List<Widget> theSelectedDays = [];

    for (int i = 0; i < eventModifierProvider.blueSelectedDays.length; i++) {
      theSelectedDays.add(Row(
        children: [
          CircleAvatar(
            radius: 3,
            backgroundColor: Colors.green[200],
          ),
          SizedBox(width: 8),
          Text(
            eventModifierProvider.blueSelectedDays[i],
            style: kEventPageEventstle,
          )
        ],
      ));
    }
    return theSelectedDays;
  }



  var eventModifierProvider;

  @override
  Widget build(BuildContext context) {
    eventModifierProvider = Provider.of<EventModifier>(context, listen: false);

    return SafeArea(
      child: Consumer<EventModifier>(
        builder: (context, value, child) => Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kProfileHeadingPadding,
                child: UpperAppBar(
                  leftIcon: Icons.insert_chart,
                  middleText: "Overview",
                  rightText: eventModifierProvider.theText,
                  changingFunction: (){
                    eventModifierProvider.tooglingTheMonthAndWeek();
                  },
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 32,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ourDays.length,
                              // dragStartBehavior: DragStartBehavior.start,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  eventModifierProvider.selectedDaysItem =
                                      index;
                                  if (eventModifierProvider.selectedDaysItem >
                                      3) {
                                    eventModifierProvider.selectedDaysItem = 3;
                                  }
                                  eventModifierProvider.blueSelectedDays = [];
                                  for (int i = eventModifierProvider
                                          .selectedDaysItem;
                                      i <
                                          eventModifierProvider
                                                  .selectedDaysItem +
                                              4;
                                      i++) {
                                    eventModifierProvider.addingTheSelectedDays(
                                      ourDays: ourDays,
                                      i: i,
                                    );
                                  }
                                  print(eventModifierProvider.blueSelectedDays);
                                  eventModifierProvider.theSelectedIndex = [];

                                  for (int eS = eventModifierProvider
                                          .selectedDaysItem;
                                      eS <
                                          eventModifierProvider
                                                  .selectedDaysItem +
                                              4;
                                      eS++) {
                                    eventModifierProvider.theSelectedIndex
                                        .add(eS);
                                  }
                                  print("the selected index is" +
                                      eventModifierProvider.theSelectedIndex
                                          .toString());
                                  eventModifierProvider
                                      .addingChartBarDataMonthly();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          curvingTheContainerCorner(index),
                                      color: (index <=
                                                  eventModifierProvider
                                                          .selectedDaysItem +
                                                      3) &&
                                              (index >=
                                                  eventModifierProvider
                                                      .selectedDaysItem)
                                          ? Color(0xFF334192)
                                          : Colors.white),
                                  child: Center(
                                    child: Text(
                                      ourDays[index].substring(0, 3),
                                      style: TextStyle(
                                          color: (index <=
                                                      eventModifierProvider
                                                              .selectedDaysItem +
                                                          3) &&
                                                  (index >=
                                                      eventModifierProvider
                                                          .selectedDaysItem)
                                              ? Colors.white
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 60),
                          child: Container(
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Average Event Number",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins")),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Selected Days",
                                  style: kEventPageEventstle,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 0, 0),
                                  child: Container(
                                      child: Column(
                                    children: showingTheSelectedDays(),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: EventChart(
                            data: eventModifierProvider.data,
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

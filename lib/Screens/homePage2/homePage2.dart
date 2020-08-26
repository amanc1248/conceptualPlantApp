import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/Heading_And_SeeAll.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/heading.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/todays_Event_List.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        decoration: BoxDecoration(
          color:Color(0xFFDDE2E5)
        ),
        child: Column(children: [
          HomePage2Heading(),
          HeadingAndSeeAll(),
          TodaysEventLists(),
        ],),
      ),
    );
  }
}
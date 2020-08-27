import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/Heading_And_SeeAll.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/deliveries_list.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/heading.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/todays_Event_List.dart';
import 'package:conceptualschoolapp/constants.dart';
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
        decoration: BoxDecoration(color: Color(0xFFDDE2E5)),
        child: Column(
          children: [
            HomePage2Heading(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: kContentPaddingEventPage,
                      child: HeadingAndSeeAll(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TodaysEventLists(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TodaysEventLists(),
                    ),
                    Padding(
                      padding: kContentPaddingEventPage,
                      child: HeadingAndSeeAll(),
                    ),
                    Expanded(
                                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          DeliveriesList(),
                          DeliveriesList(),
                          DeliveriesList(),
                          DeliveriesList(),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/Heading_And_SeeAll.dart';
import 'package:conceptualschoolapp/Screens/homePage2/local_widgets/heading.dart';
import 'package:conceptualschoolapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  var eventModifierProvider;

  @override
  Widget build(BuildContext context) {
    eventModifierProvider = Provider.of<EventModifier>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F5F6),
              body: Consumer<EventModifier>(
          builder: (context, value, child) => Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                //1) Heading
                Padding(
                  padding: kProfileHeadingPadding,
                  child: HomePage2Heading(),
                ),
                //2) the white container
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: kContentPaddingEventPage,
                          child: HeadingAndSeeAll(
                            titleText: "TODAYS LECTURE",
                            noOfLectures: eventModifierProvider
                                .showTodaysEventlist()
                                .length
                                .toString(),
                            goToAllEventPageFunction: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => AllEventPage()),
                              // );
                            },
                          ),
                        ),
                        Expanded(
                            child: ListView(
                          children: eventModifierProvider.showTodaysEventlist(),
                        )),
                        Column(
                          children: [
                            Padding(
                              padding: kContentPaddingEventPage,
                              child: HeadingAndSeeAll(
                                
                                titleText: "DELIVERIES",
                                noOfLectures: eventModifierProvider
                                    .withAndWithoutTodaysDate()
                                    .length
                                    .toString(),
                              ),
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: eventModifierProvider
                                    .withAndWithoutTodaysDate(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

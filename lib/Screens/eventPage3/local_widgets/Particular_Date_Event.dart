import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:conceptualschoolapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParticularDateEvent extends StatelessWidget {
  final String lectureSubject;
  final String lectureStandard;
  final String lectureRoom;
  ParticularDateEvent({this.lectureStandard, this.lectureSubject,this.lectureRoom});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 12),
      child: Consumer<EventModifier>(
        builder: (context, value, child) => Container(
            height: 165,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 4)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lectureSubject,
                    style: kSubjectStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    lectureStandard,
                    style: kEventPageEventstle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(
                          lectureRoom,
                          style: kEventPageEventstle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.supervisor_account,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Andrew Carnegie",
                              style: kEventPageEventstle,
                            ),
                            Text(
                              "andrewcarne1@gmail.com",
                              style: kEventPageEventstle,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

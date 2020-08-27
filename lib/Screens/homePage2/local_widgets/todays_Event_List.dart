import 'package:conceptualschoolapp/constants.dart';
import 'package:flutter/material.dart';

class TodaysEventLists extends StatefulWidget {
  @override
  _TodaysEventListsState createState() => _TodaysEventListsState();
}

class _TodaysEventListsState extends State<TodaysEventLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 12),
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color:Colors.white,
          boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0,4)
        ),
      ],
        ),
        child: Row(
          children: [
            //first column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "09:30",
                  style:
                      kSubjectStyle,
                ),
                Text(
                  "AM",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w900),
                ),
              ],
            ),
            //second column
            SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mathematic ||",
                  style: kSubjectStyle,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on,color:Colors.grey),
                    Text("Room 120, Block c",style: kEventPageEventstle,)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timelapse,color:Colors.grey),
                    Text("1 hour 30 minutes",style: kEventPageEventstle,)
                  ],
                )
              ],
            )
          ],
        ));
  }
}

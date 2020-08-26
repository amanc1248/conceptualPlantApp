import 'package:conceptualschoolapp/constants.dart';
import 'package:flutter/material.dart';

class TodaysEventLists extends StatefulWidget {
  @override
  _TodaysEventListsState createState() => _TodaysEventListsState();
}

class _TodaysEventListsState extends State<TodaysEventLists> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          
          height: 115,
          decoration: BoxDecoration(
            color:Colors.white
            
          ),
          child: Row(
            children: [
              //first column
              Column(
                children: [
                  Text(
                    "09:30",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "AM",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              //second column
              Column(
                children: [
                  Text(
                    "Mathematic ||",
                    style: kSubjectStyle,
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text("Room 120, Block c")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timelapse),
                      Text("1 hour 30 minutes")
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}

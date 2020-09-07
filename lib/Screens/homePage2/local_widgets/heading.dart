import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomePage2Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
DateTime now = DateTime.now();
String formattedDay = DateFormat('EEEE').format(now);
String formattedMonth = DateFormat('-MM-MMMM').format(now);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 12),
            child: CircleAvatar(radius: 25, backgroundColor: Colors.white70),
          ),
          Expanded(
                      child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi John",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800,fontFamily: "Poppins")),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Here is your schedule\n for a week",
                    style: TextStyle(fontSize: 14,fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              formattedDay.substring(0,3) + formattedMonth.substring(0,7),
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF334192),fontFamily: "Poppins"),
            ),
          )
        ],
      ),
    );
  }
}

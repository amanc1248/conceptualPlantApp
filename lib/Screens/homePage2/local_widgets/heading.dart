import 'package:flutter/material.dart';

class HomePage2Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 12, 8, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: CircleAvatar(radius: 30, backgroundColor: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi John",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                  Text(
                    "Here is your schedule\n for a week",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:40),
              child: Text(
                  "Mon 12 Jan",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF334192)),
                ),
            )
          ],
        ),
      ),
    );
  }
}

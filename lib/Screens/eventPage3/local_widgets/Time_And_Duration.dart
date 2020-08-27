import 'package:flutter/material.dart';

class TimeAndDuration extends StatelessWidget {
  final String time;
  final String amPm;
  final String duration;
  TimeAndDuration({this.time, this.amPm, this.duration});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.arrow_right, size: 35, color: Colors.yellow),
          Text(
            time,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            amPm,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: Text(
              duration,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF334192)),
            ),
          )
        ],
      ),
    );
  }
}

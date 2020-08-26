import 'package:conceptualschoolapp/constants.dart';
import 'package:flutter/material.dart';

class ParticularDateEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
      child: Container(
          height: 155,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 2.0, color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mathematic ||",
                  style: kSubjectStyle,
                ),
                Text(
                  "Standard Level",
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
                        "Room 120, Block C",
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
                      padding: const EdgeInsets.fromLTRB(8  , 8, 8, 8),
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
    );
  }
}

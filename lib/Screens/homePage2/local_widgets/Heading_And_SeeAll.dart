import 'package:flutter/material.dart';

class HeadingAndSeeAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: 'TODAY LECTURES',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800,color:Colors.black),
            children: <TextSpan>[
              TextSpan(text: " "),
              TextSpan(text: "[5]")
            ],
          ),
        ),
        
        Text(
          "See all",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF334192)),
        )
      ],
    ));
  }
}

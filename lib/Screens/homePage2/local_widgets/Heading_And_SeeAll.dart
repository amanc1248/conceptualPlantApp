import 'package:flutter/material.dart';

class HeadingAndSeeAll extends StatelessWidget {
  final String titleText;
  final String noOfLectures;
  final Function goToAllEventPageFunction;
  HeadingAndSeeAll(
      {this.titleText, this.noOfLectures, this.goToAllEventPageFunction});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: titleText,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w800, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: " "),
              TextSpan(text: "[" + noOfLectures.toString() + "]")
            ],
          ),
        ),
        GestureDetector(
          onTap: goToAllEventPageFunction,
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF334192)),
          ),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:conceptualschoolapp/constants.dart';

class UserProfileStudentProfile extends StatefulWidget {
  final String classHeading;
   UserProfileStudentProfile(
      {this.classHeading});

  @override
  _UserProfileStudentProfileState createState() => _UserProfileStudentProfileState();
}

class _UserProfileStudentProfileState extends State<UserProfileStudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.classHeading, style: kTextStyleProfilePage),
        Text(
          widget.classHeading,
          style: kUnderHeadingStyleProfilepage,
        )
      ],
    );
  }
}

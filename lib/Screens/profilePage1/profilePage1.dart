import 'package:flutter/material.dart';
import 'package:conceptualschoolapp/widgets/Upper_AppBar.dart';
import 'package:conceptualschoolapp/studentDetails.dart';

import '../../constants.dart';
import 'local_widgets/student_class_details.dart';

class ProfilePage1 extends StatefulWidget {
  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF7F8F9),
          body: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: UpperAppBar(
                      leftIcon: Icons.account_circle,
                      middleText: "My Profile",
                      rightText: "Edit"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Color(0xFFE7EBED),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    studentDetails.name,
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Padding(
                                  padding: kTestPaddingProfilePage,
                                  child: Text(
                                    studentDetails.number.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFC2C4C4),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: kTestPaddingProfilePage,
                                  child: Text(studentDetails.program,
                                      style: kTextStyleProfilePage),
                                ),
                                Padding(
                                  padding: kTestPaddingProfilePage,
                                  child: Text(
                                    studentDetails.school,
                                    style: kTextStyleProfilePage,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      UserProfileStudentProfile(
                                          classHeading: "Class"),
                                      UserProfileStudentProfile(
                                          classHeading: "Year")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      UserProfileStudentProfile(
                                          classHeading: "Absent"),
                                      UserProfileStudentProfile(
                                          classHeading: "Present")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

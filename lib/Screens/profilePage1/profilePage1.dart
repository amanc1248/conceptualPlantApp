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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F5F6),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: kProfileHeadingPadding,
                child: UpperAppBar(
                    leftIcon: Icons.account_circle,
                    middleText: "My Profile",
                    rightText: "Edit"),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins"),
                                ),
                              ),
                              Padding(
                                padding: kTestPaddingProfilePage,
                                child: Text(
                                  studentDetails.number.toString(),
                                  style: kTextStyleProfilePage,
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

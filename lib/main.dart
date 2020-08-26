
import 'package:flutter/material.dart';

import 'Screens/eventPage3/eventPage3.dart';
import 'Screens/profilePage1/profilePage1.dart';

void main() => runApp(MyStatefulWidget());

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _children=[
    ProfilePage1(),
    EventPage3(),
    ProfilePage1(),
    ProfilePage1(),
    ProfilePage1(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: _children.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Color(0xFF334192),
                ),
                title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), title: Text("")),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF334192),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

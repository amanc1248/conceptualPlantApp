// import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   CalendarController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//   }

//   EventModifier eventModifierProvider;
//   @override
//   Widget build(BuildContext context) {
//     eventModifierProvider = Provider.of<EventModifier>(context, listen: false);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TableCalendar(
//               onDaySelected: eventModifierProvider.whenSelectedDay,
//             ),
//             GestureDetector(
//               onTap: () {
//                 _showAddDialog();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   _showAddDialog() async {
//     await showDialog(
//       context: context,
//       builder: (context) => FlatButton(
//         onPressed: eventModifierProvider.settingTheValue(
//             controller: _controller.selectedDay),
//       ),
//     );
//   }
// }

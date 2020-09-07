import 'package:conceptualschoolapp/Screens/Model/event_modifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpperAppBar extends StatelessWidget {
  const UpperAppBar({
    this.leftIcon,
    this.middleText,
    this.rightText,
    this.changingFunction
  });
  final IconData leftIcon;
  final String middleText;
  final String rightText;
  final Function changingFunction;
  @override
  Widget build(BuildContext context) {
    final eventModifierProvider =
        Provider.of<EventModifier>(context, listen: false);

    return Consumer<EventModifier>(
      builder: (context, value, child) => Row(
        children: [
          Icon(
            leftIcon,
            size: 40,
            color: Color(0xFF334192),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              middleText,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Poppins"),
            ),
          ),
          GestureDetector(
            onTap: changingFunction,
            child: Text(
              rightText,
              style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w200,
                  color: Color(0xFF334192),fontFamily: "Poppins"),
            ),
          )
        ],
      ),
    );
  }
}

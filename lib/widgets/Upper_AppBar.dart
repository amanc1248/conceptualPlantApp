import 'package:flutter/material.dart';
class UpperAppBar extends StatelessWidget {
  const UpperAppBar({
    @required this.leftIcon,
    @required this.middleText,
    @required this.rightText,
  });
final IconData leftIcon;
final String middleText;
final String rightText;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         
         Icon(leftIcon,size: 40,color: Color(0xFF334192),),
         Text(middleText,style: TextStyle(
           fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black
         ),),
         Text(rightText, style: TextStyle(
           fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF334192)
         ),)
       ],),
     );
  }
}

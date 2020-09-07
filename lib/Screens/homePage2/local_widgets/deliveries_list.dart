import 'package:flutter/material.dart';

class DeliveriesList extends StatefulWidget {
  final String subjectName;
  final String roomNo;
  final int theDaysLeft;
  DeliveriesList({this.roomNo,this.subjectName,this.theDaysLeft});
  @override
  _DeliveriesListState createState() => _DeliveriesListState();
}

class _DeliveriesListState extends State<DeliveriesList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        height: 10,
        width: 200,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
             boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 3,
          offset: Offset(0,4)
        ),
      ],

        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Deadline", style: TextStyle(color: Colors.grey, fontSize: 15)),
              SizedBox(height: 5),
              Row(
                children: [
                  CircleAvatar(
                    radius:5,
                    backgroundColor: (widget.theDaysLeft<4?Colors.red:Colors.orangeAccent),
                  ),
                  SizedBox(width: 5,),
                  Text(widget.theDaysLeft.toString()+" days left",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 23),
              Text(widget.subjectName,style:TextStyle(fontSize:19,fontWeight: FontWeight.bold),),
              Text(widget.roomNo,style:TextStyle(fontSize:19,fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

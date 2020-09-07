import 'package:conceptualschoolapp/Screens/Model/chart_details.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class EventChart extends StatelessWidget {
  final List<ChartDetails> data;
  final Function dataFunction;
  EventChart({this.data,this.dataFunction});
  @override
  Widget build(BuildContext context) {
    List<Series<ChartDetails, String>> series = [
      Series(
        data: data,
        id: "days",
        domainFn: (ChartDetails theDetails, _) => theDetails.day,
        measureFn: (ChartDetails theDetails, _) => theDetails.eventNumber,
        
      )
    ];
    return Padding(
      padding: const EdgeInsets.only(left:16,top:0,bottom:12,right:16),
      child: Container(
            child: BarChart(
      series,
      animate: true,
            )),
    );
  }
}

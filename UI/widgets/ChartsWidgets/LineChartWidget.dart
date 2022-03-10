import 'package:flutter/material.dart';
import 'package:lunar_charts/Models/ChartsModels/LineChartModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}
String liTitle="test";
late List<LineChartDataa> futureData =[];
testing() async{
  LineChartDataa test = new LineChartDataa(x:"5", y: 3);
  futureData = await test.fetchData() ;
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
      testing(); //to activate the function to fetch Data
      return Container(
        height: 400,
        margin: EdgeInsets.only(top: 5,left: 8,right: 8),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:Colors.orangeAccent[100],
        ),
        child: Center( child:
        SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelRotation: 90,
              labelStyle: TextStyle(
                //color: Colors.blueGrey,
                  fontFamily: 'Roboto',
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500
              ),

            ),

            // Chart title
            title: ChartTitle(text: liTitle),
            // Enable legend
            legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.top
            ),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<LineChartDataa, String>>[
              LineSeries<LineChartDataa, String>(
                  dataSource: futureData,
                  xValueMapper: (LineChartDataa person, _) => person.x,
                  yValueMapper: (LineChartDataa person, _) => person.y,
                  name: 'person',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
        ),
      );

  }
}

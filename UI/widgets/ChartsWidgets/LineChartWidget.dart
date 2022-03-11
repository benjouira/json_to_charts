import 'package:flutter/material.dart';
import 'package:lunar_charts/Models/ChartsModels/LineChartModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  String liTitle="test";
  late List<LineChartData> futureData =[];
  loadDataFromJson() async{
    waitSomeSeconds ();
    LineChartData element = new LineChartData(x:"5", y: 3);
    return await element.fetchData() ;


  }
 /* loadDataFromJson2() async{
    LineChartData element = new LineChartData(x:"5", y: 3);
    futureData = await element.fetchData() ;
  }
*/
Future waitSomeSeconds () async{
  await Future.delayed(Duration(seconds: 2));
}
@override
   Widget build(BuildContext context ) {
      return FutureBuilder(
          future: loadDataFromJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData){
            return  Container(
              height: 400,
              margin: EdgeInsets.only(top: 5, left: 8, right: 8),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orangeAccent[100],
              ),
              child: Center(child:
              SfCartesianChart (
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
                  series: <ChartSeries<LineChartData, String>>[
                    LineSeries<LineChartData, String>(
                        dataSource: snapshot.data ,
                        xValueMapper: (LineChartData person, _)  => person.x,
                        yValueMapper: (LineChartData person, _) => person.y,
                        name: 'person',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
              ),
            );}
            else{
              return SizedBox(
                height: 200,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ) ;
            }
          });
      // return Container(
      //   height: 400,
      //   margin: EdgeInsets.only(top: 5, left: 8, right: 8),
      //   decoration: new BoxDecoration(
      //     borderRadius: BorderRadius.circular(16),
      //     color: Colors.orangeAccent[100],
      //   ),
      //   child: Center(child:
      //   SfCartesianChart (
      //       primaryXAxis: CategoryAxis(
      //         labelRotation: 90,
      //         labelStyle: TextStyle(
      //           //color: Colors.blueGrey,
      //             fontFamily: 'Roboto',
      //             fontSize: 10,
      //             fontStyle: FontStyle.italic,
      //             fontWeight: FontWeight.w500
      //         ),
      //
      //       ),
      //
      //       // Chart title
      //       title: ChartTitle(text: liTitle),
      //       // Enable legend
      //       legend: Legend(
      //           isVisible: true,
      //           // Legend will be placed at the left
      //           position: LegendPosition.top
      //       ),
      //       // Enable tooltip
      //       tooltipBehavior: TooltipBehavior(enable: true),
      //       series: <ChartSeries<LineChartData, String>>[
      //         LineSeries<LineChartData, String>(
      //             dataSource: futureData ,
      //             xValueMapper: (LineChartData person, _)  => person.x,
      //             yValueMapper: (LineChartData person, _) => person.y,
      //             name: 'person',
      //             // Enable data label
      //             dataLabelSettings: DataLabelSettings(isVisible: true))
      //       ]),
      //   ),
      // );
        }


 }




import 'package:flutter/material.dart';
import 'package:lunar_charts/Models/ChartsModels/LineChartModel.dart';
import 'package:lunar_charts/UI/widgets/ChartsWidgets/LineChartWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      //_cardList.add(_card(liTitle1));
      _cardList.add(LineChartWidget());
    });
  }
  String liTitle1 ='Data analysis';
  Widget _card( liTitle) {
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
  late List<LineChartDataa> futureData;
  testing() async{
    LineChartDataa test=new LineChartDataa(x:"5", y: 3);
    futureData = await test.fetchData() ;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    testing();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Add Widget Dynamically"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
            itemCount: _cardList.length,
            itemBuilder: (context,index){
              return _cardList[index];
            }),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _addCardWidget,
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('My Title'),
              content: Container(child: Text ("Alert dialog random text"),),
            ),
          );
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
      setState(()  {
        _cardList.add(LineChartWidget());
      });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     LineChartWidget();
  //   });
  // }

  String dropDownValue = "Line Chart";
  changeDropDownValue(newValue) {
    setState(() {
      dropDownValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            builder: (BuildContext context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setState)
            => AlertDialog(
              title: Text('New Chart'),
              content: Column(
                children: [
                  Row(children: [
                    Container(child: Text ("Select Chart : "),),
                    DropdownButton(
                      value: dropDownValue,
                      icon: Icon(Icons.keyboard_arrow_down_rounded),

                      items: ["Data Grid","Line Chart","Column Chart"].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: ( newValue) {
                        setState(() {
                          dropDownValue = newValue.toString();
                        });
                      },

                    ),
                  ],),
                  OutlinedButton(
                    onPressed: () {
                      //loadDataFromJson();
                      _addCardWidget();
                      setState(() {
                        Navigator.of(context).pop();
                      });
                      },
                    child: Text("ADD CHART"),
                  )
                ],
              ),
            ),
            )
          );

        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

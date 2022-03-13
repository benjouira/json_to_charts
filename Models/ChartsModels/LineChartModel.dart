import 'dart:convert';

import 'package:http/http.dart' as http;


class LineChartData {
  // String xColumnName;
  // String yColumnName;
  dynamic x;
  num y;
  LineChartData({
    required this.x,
    required this.y,
    // required this.xColumnName,
    // required this.yColumnName,
  });
   String val = "id";
  factory LineChartData.fromMap(Map<String, dynamic> json) => LineChartData(
    // y: json["id"],
    x: json["username"],
    y: json[json.keys.elementAt(0)],
    // y: json[yColumnName],

  );


  Future<List<LineChartData>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed.map<LineChartData>((json) => LineChartData.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load ');
    }
  }
}
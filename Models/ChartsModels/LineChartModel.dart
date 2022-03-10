import 'dart:convert';

import 'package:http/http.dart' as http;


class LineChartDataa {

  dynamic x;
  num y;
  LineChartDataa({
    required this.x,
    required this.y,
  });


  List<LineChartDataa> dataFromJson(String str) =>
      List<LineChartDataa>.from(json.decode(str).map((x) => LineChartDataa.fromMap(x)));


  factory LineChartDataa.fromMap(Map<String, dynamic> json) => LineChartDataa(
    y: json["id"],
    x: json["username"],
  );


  Future<List<LineChartDataa>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<LineChartDataa>((json) => LineChartDataa.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load ');
    }
  }
}
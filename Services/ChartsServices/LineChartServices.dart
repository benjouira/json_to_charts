import 'dart:convert';
import 'package:http/http.dart' as http;

class ChartServices {
  Future getData()async{
    var url = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    print ( responsebody);
  }
}
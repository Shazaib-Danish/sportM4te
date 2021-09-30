import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportm4te/Models/user_my_events.dart';

class MyEventsApiManager {
  Future<Host> myEvents(String token) async {
    var client = http.Client();
     var myModels;
    try {
      final response = await client.get(
          Uri.parse('https://api.sportm4te.com/v1.0/events/me/?token=$token'));
      print('This is code getting from ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(response.body);
        myModels = Host.fromJson(jsonMap);
      }
    } on Exception {
      return myModels;
    }
    return myModels;
  }
}

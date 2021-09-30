import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sportm4te/Models/user_model.dart';
import 'package:sportm4te/Models/user_search_model.dart';

class UsersSearchApiManager {
  Future<Users> searchUsers(String token) async {
    var client = http.Client();
    var usersSearchModel;
    try {
      var response = await client.get(Uri.parse('https://api.sportm4te.com/v1.0/user/search/?token=$token'));
      print('This is code getting from ${response.statusCode}');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(response.body);
        usersSearchModel = Users.fromJson(jsonMap);
      }
    } on Exception {
      return usersSearchModel;
    }
    return usersSearchModel;
  }
}

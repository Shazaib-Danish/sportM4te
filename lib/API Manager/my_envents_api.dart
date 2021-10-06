import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:sportm4te/Models/user_my_events.dart';
import 'package:http/http.dart' as http;

class MyEventAPIManager {
  Future<UserMyEvents> getUserEvents(String token, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse('https://api.sportm4te.com/v1.0/events/me/?token=$token'));
    print(response.statusCode);
    return UserMyEvents.fromJson(jsonDecode(response.body));
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sportm4te/Models/user_events_details.dart';

import 'package:http/http.dart' as http;

class EventDetailAPIManager {
  Future<UserMyEventsDetails> getUserEvents(
      String token, int id, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://api.sportm4te.com/v1.0/events/detail/$id?token=$token'));

    return UserMyEventsDetails.fromJson(jsonDecode(response.body));
  }
}

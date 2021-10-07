import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sportm4te/Models/search_events.dart';
import 'package:http/http.dart' as http;

class EventSearchAPIManager {
  Future<SearchEvents> searchEvents(String token, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse('https://api.sportm4te.com/v1.0/events/search?token=$token'));

    return SearchEvents.fromJson(jsonDecode(response.body));
  }

  Future<SearchEvents> searchEventsByName(
      String token, String name, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://api.sportm4te.com/v1.0/events/search/?q=$name&token=$token'));

    return SearchEvents.fromJson(jsonDecode(response.body));
  }
}

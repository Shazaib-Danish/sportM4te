import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/friend_request_model.dart';
import 'package:sportm4te/Models/unsend_request.dart';
import 'package:sportm4te/Models/user_events_details.dart';

import 'package:http/http.dart' as http;

class UnsendRequestAPIManager {
  Future<UnesendRequest> unSentFriendRequest(
      String token, int id, BuildContext context) async {
    var client = http.Client();
    UnesendRequest _model;
    var response = await client.post(Uri.parse(
        'https://api.sportm4te.com/v1.0/friends/$id/remove/?=$token'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    _model = UnesendRequest.fromJson(jsonMap);
    Provider.of<DataManager>(context, listen: false).unSentRequest(_model);
    return _model;
  }
}

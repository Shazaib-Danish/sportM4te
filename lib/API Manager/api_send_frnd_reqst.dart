import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/friend_request_model.dart';
import 'package:sportm4te/Models/user_events_details.dart';

import 'package:http/http.dart' as http;

class SendFriendRequestAPIManager {
  Future<FriendRequestModel> sentFriendRequest(
      String token, int id, BuildContext context) async {
    var client = http.Client();
    FriendRequestModel _model;
    var response = await client.post(Uri.parse(
        'https://api.sportm4te.com/v1.0/friends/$id/request/?token=$token'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    _model = FriendRequestModel.fromJson(jsonMap);
    Provider.of<DataManager>(context, listen: false).sentRequest(_model);
    return FriendRequestModel.fromJson(jsonDecode(response.body));
  }
}

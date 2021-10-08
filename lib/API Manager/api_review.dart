import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/block_friend.dart';
import 'package:sportm4te/Models/friend_request_model.dart';
import 'package:sportm4te/Models/review_model.dart';
import 'package:sportm4te/Models/unsend_request.dart';
import 'package:sportm4te/Models/user_events_details.dart';

import 'package:http/http.dart' as http;

class ReviewAPIManager {
  Future<Review> reviewFriend(
      String token, double rating, int reportr, BuildContext context) async {
    var client = http.Client();
    Review _model;
    var response = await client.post(Uri.parse(
        'https://api.sportm4te.com/v1.0/user/$reportr/review?token=$token&rating=$rating'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    _model = Review.fromJson(jsonMap);
    Provider.of<DataManager>(context, listen: false).reviewRes(_model);
    return _model;
  }
}

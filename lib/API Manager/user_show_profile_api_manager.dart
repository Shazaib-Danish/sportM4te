import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sportm4te/Models/show_user_profile.dart';
import 'package:http/http.dart' as http;

class ShowProfileUserApiManager {
  Future<ShowUserProfile> getUserDetailsByName(
      String username, String token, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://api.sportm4te.com/v1.0/user/profile/$username?token=$token'));

    return ShowUserProfile.fromJson(jsonDecode(response.body));
  }
}

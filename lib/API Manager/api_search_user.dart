import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/user_search_model.dart';

class UserSearchAPIManager {
  Future<UserSearchModel> searchUser(String token, String username) async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://api.sportm4te.com/v1.0/user/search/?q=$username&token=$token'));

    return UserSearchModel.fromJson(jsonDecode(response.body));
  }

  Future<UserSearchModel> showUser(String token, BuildContext context) async {
    var client = http.Client();

    var response = await client.get(
        Uri.parse('https://api.sportm4te.com/v1.0/user/search/?token=$token'));
    return UserSearchModel.fromJson(jsonDecode(response.body));
  }
}

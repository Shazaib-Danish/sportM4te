import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Models/user_model.dart';

class UserLoginApiManager {
  Future<UserModel> login(String email, String password, BuildContext context) async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.post(Uri.parse(
          'https://api.sportm4te.com/v1.0/user/login?email=$email&password=$password'));
      print('This is code getting from ${response.statusCode}');
      if (response.statusCode == 201) {
        Provider.of<DataManager>(context, listen: false).checkLogin('Done');
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(response.body);
        newsModel = UserModel.fromJson(jsonMap);
        print('aaaaaaaaaaaaaa');
        Provider.of<DataManager>(context, listen: false).loginData(newsModel);
      }
      else if(response.statusCode == 400){
        Provider.of<DataManager>(context, listen: false).checkLogin('Bad Password');
      }
    } on Exception {
      return newsModel;
    }
    return newsModel;
  }
}

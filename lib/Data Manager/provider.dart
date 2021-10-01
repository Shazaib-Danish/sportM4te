import 'package:flutter/cupertino.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/API%20Manager/user_seach_api_manager.dart';
import 'package:sportm4te/Models/user_model.dart';
import 'package:sportm4te/Models/user_my_events.dart';
import 'package:sportm4te/Models/user_search_model.dart';

class DataManager extends ChangeNotifier {
  String isLoginDone = '';
  bool isDarkMode = false;
  String userToken = '';
  late Future<Users> searchUsersList;
  late UserModel userData;
  late UserMyEvents userMyEvents;

  void checkLogin(String loginCode) {
    isLoginDone = loginCode;
    notifyListeners();
  }

  void darkMode(bool mode) {
    isDarkMode = mode;
    notifyListeners();
  }

  bool get isLightMode {
    return isDarkMode;
  }

  // void usersSearchList(String token){
  //    searchUsersList = UsersSearchApiManager().searchUsers(token);
  //    notifyListeners();
  // }

  Future<Users> get getSearchUsersList {
    return searchUsersList;
  }

  void loginData(UserModel userModel) {
    userData = userModel;
  }

  void setUserToken(String token) {
    userToken = token;
  }

  String get getUserToken {
    return userToken;
  }

  void userEventsData(UserMyEvents myEvents) {
    userMyEvents = myEvents;
  }
}

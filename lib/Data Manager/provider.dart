import 'package:flutter/cupertino.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/API%20Manager/user_show_profile_api_manager.dart';
import 'package:sportm4te/Models/block_friend.dart';
import 'package:sportm4te/Models/friend_request_model.dart';
import 'package:sportm4te/Models/unsend_request.dart';
import 'package:sportm4te/Models/user_model.dart';
import 'package:sportm4te/Models/user_my_events.dart';
import 'package:sportm4te/Models/user_search_model.dart';

class DataManager extends ChangeNotifier {
  String isLoginDone = '';
  bool isDarkMode = false;
  String userToken = '';
  String userName = '';
  String userImage = '';
  int? userID;
  late Future<Users> searchUsersList;
  late UserModel userData;
  late UserMyEvents userMyEvents;
  late FriendRequestModel friendRequest;
  late UnesendRequest unesendRequest;
  late BlockFriend blockFriend;

  void unSentRequest(UnesendRequest userModel) {
    unesendRequest = userModel;
  }

  void blockFreind(BlockFriend userModel) {
    blockFriend = userModel;
  }

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

  void sentRequest(FriendRequestModel userModel) {
    friendRequest = userModel;
  }

  void setUserToken(String token) {
    userToken = token;
  }

  void setUserName(String token) {
    userName = token;
  }

  void setUserImage(String token) {
    userImage = token;
  }

  void setUserID(int token) {
    userID = token;
  }

  String get getUserToken {
    return userToken;
  }

  void userEventsData(UserMyEvents myEvents) {
    userMyEvents = myEvents;
  }
}

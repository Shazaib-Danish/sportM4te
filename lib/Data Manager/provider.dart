import 'package:flutter/cupertino.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/Models/user_model.dart';

class DataManager extends ChangeNotifier{
  bool isLoginDone = false;
  bool isDarkMode = false;
  late Future<UserModel> userData;

  void checkLogin(bool loginCheck){
    isLoginDone = loginCheck;
    notifyListeners();
  }

  void darkMode(bool mode){
    isDarkMode = mode;
    notifyListeners();
  }
  bool get isLightMode{
    return isDarkMode;
  }


}
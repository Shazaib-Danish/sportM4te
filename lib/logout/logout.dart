import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportm4te/UI/login_screen.dart';

Future<void> logoutUser(BuildContext context) async {
  SharedPreferences loginPreferences = await SharedPreferences.getInstance();
  loginPreferences.setBool('isLogedIn', true);
  loginPreferences.remove('userToken').whenComplete(() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
            (Route<dynamic> route) => false);
  });
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: const Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = FlatButton(
    child: const Text("Yes"),
    onPressed: () {},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("AlertDialog"),
    content: const Text(
        "Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

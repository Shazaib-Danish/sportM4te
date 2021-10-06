import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/UI/my_events_screen.dart';
import 'package:sportm4te/UI/search_event.dart';
import 'package:sportm4te/Widgets/bottom_nav_bar.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.isLogedIn}) : super(key: key);

  final isLogedIn;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> keyDashboard = GlobalKey();
  int _selectedIndex = 2;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late SharedPreferences loginPreferences;
  late WebViewController _webViewController;

  @override
  void initState() {
    getUserDataIfLogedIn();
    _selectedIndex = 2;
    super.initState();
  }

  void getUserDataIfLogedIn() async {
    if (widget.isLogedIn) {
      loginPreferences = await SharedPreferences.getInstance();
      Provider.of<DataManager>(context, listen: false)
          .setUserToken(loginPreferences.getString('userToken').toString());
      print('Here is token of user already logedin ' +
          loginPreferences.getString('userToken').toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyDashboard,
      bottomNavigationBar: BottomNavBar(
        scaffoldKey: keyDashboard,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
          if (_selectedIndex == 4) {
            keyDashboard.currentState!.openDrawer();
          }
        },
        index: _selectedIndex,
      ),
      drawer: const Drawer(
        child: Draawer(),
      ),
      body: _selectedIndex == 0
          ? const SearchEvent()
          : _selectedIndex == 1
              ? const MyEvents()
              : const Text('A'),
    );
  }
}

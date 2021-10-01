import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/Widgets/bottom_nav_bar.dart';
import 'package:sportm4te/Widgets/draawer.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import 'package:flutter/services.dart';
// import 'package:flutter_user_agent/flutter_user_agent.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.isLogedIn}) : super(key: key);

  final isLogedIn;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _keyDashboard = GlobalKey();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late SharedPreferences loginPreferences;
  late WebViewController _webViewController;

  @override
  void initState() {
    getUserDataIfLogedIn();
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
      key: _keyDashboard,
      bottomNavigationBar: BottomNavBar(
        scaffoldKey: _keyDashboard,
      ),
      drawer: const Drawer(
        child: Draawer(),
      ),
      body: WebView(
        initialUrl: 'https://app.sportm4te.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');

          // Removes header and footer from page
          _webViewController
              .evaluateJavascript(
                  "document.getElementById('head').style.display = 'none'")
              .then((value) => debugPrint('Page finished loading Javascript'))
              .catchError((onError) => debugPrint('$onError'));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'UI/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_){
        return DataManager();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
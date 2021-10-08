import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';

import 'Theme/themes.dart';
import 'UI/dashboard.dart';
import 'UI/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences loginPreferences = await SharedPreferences.getInstance();
  var status = loginPreferences.getBool('isLogedIn') ?? false;
  print(status);
  runApp(MyApp(
    isLogedIn: status,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isLogedIn}) : super(key: key);

  final isLogedIn;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return DataManager();
      },
      builder: (context , child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: Provider.of<DataManager>(context).themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: isLogedIn
              ? Login()
              : const Dashboard(
            isLogedIn: true,
          ),
        );
      },
    );
  }
}

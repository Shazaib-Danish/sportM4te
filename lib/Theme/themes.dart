import 'package:flutter/material.dart';

class MyThemes{

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.black,
  );

}
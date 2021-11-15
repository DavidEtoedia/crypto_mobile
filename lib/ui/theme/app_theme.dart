import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xff171520),
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)));
}

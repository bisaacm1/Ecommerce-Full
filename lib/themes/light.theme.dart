import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xff00cf69);
const lightColor = const Color(0xffffffff);
const backgroundColor = const Color(0xfff5f5f5);
const accentColor = Colors.white;

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: backgroundColor,
    /*   textTheme: TextTheme(
      headline6: TextStyle(color: Colors.red),
    ), */
  );
}

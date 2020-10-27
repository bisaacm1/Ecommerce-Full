import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xffFFCC00);
const lightColor = const Color(0xffffffff);
const accentColor = Colors.black26;

ThemeData darkYellowTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: accentColor,
    /*   textTheme: TextTheme(
      headline6: TextStyle(color: Colors.red),
    ), */
  );
}

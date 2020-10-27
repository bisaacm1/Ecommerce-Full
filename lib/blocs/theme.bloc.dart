import 'package:ecommerce_full/settings.dart';
import 'package:ecommerce_full/themes/dark-yellow.theme.dart';
import 'package:ecommerce_full/themes/dark.theme.dart';
import 'package:ecommerce_full/themes/light.theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light':
        theme = lightTheme();
        break;

      case 'dark':
        theme = darkTheme();
        break;

      case 'dark-yellow':
        theme = darkYellowTheme();
        break;
    }
    Settings.theme = color;
    notifyListeners();
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.get('theme');
    Settings.theme = theme == null || theme.isEmpty ? 'light' : theme;
    change(Settings.theme);
  }
}

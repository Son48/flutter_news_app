import 'package:flutter/material.dart';
import '../services/dark_theme_prefence.dart';

class ThemeProvider with ChangeNotifier{
  ThemePrefence darkThemePreferences = ThemePrefence();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }

}
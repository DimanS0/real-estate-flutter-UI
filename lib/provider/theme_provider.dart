import 'package:flutter/material.dart';

import '../theme/theme_mode.dart';


class ThemeProvider with ChangeNotifier {
  // Initialize the theme mode to light by default
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for the current theme mode
  ThemeMode get themeMode => _themeMode;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Method to get the current theme data
  ThemeData get themeData {
    return (_themeMode == ThemeMode.light) ? AppTheme.lightTheme : AppTheme.darkTheme;
  }
}

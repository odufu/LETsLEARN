import 'package:flutter/material.dart';
import '../theme/darkMode.dart' as dark;
import '../theme/lightMode.dart' as light;

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = dark.darkTheme;
  bool _isDarkMode = false;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? dark.darkTheme : light.lightTheme;
    notifyListeners();
  }
}
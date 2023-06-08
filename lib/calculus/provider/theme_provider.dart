import 'package:calculator/utils/state_utils.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData theme = ThemeData();

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme =>
      _isDarkMode ? MyTheme.darkTheme : MyTheme.lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

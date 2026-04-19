import 'package:enently/core/shared/shared_pref_manger.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = SharedPrefsHelper.getCurrentTheme();
  bool get isDark => currentTheme == ThemeMode.dark;
  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    SharedPrefsHelper.saveCurrentTheme(currentTheme);
    notifyListeners();
  }
}

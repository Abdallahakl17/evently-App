import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences prefs;

  static const String onboardingKey = 'onboarding_completed';
  static const String themeKey = 'themeKey';
  static const String langKey = 'langKey';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveOnboardingStatus(bool value) async {
    await prefs.setBool(onboardingKey, value);
  }

  static bool getOnboardingStatus() {
    return prefs.getBool(onboardingKey) ?? false;
  }

  static Future<void> saveCurrentTheme(ThemeMode theme) async {
    String cachedTheme = theme == ThemeMode.light ? 'Light' : 'Dark';

    await prefs.setString(themeKey, cachedTheme);
  }

  static ThemeMode getCurrentTheme() {
    String? cachedTheme = prefs.getString(themeKey);

    if (cachedTheme == 'Light') {
      return ThemeMode.light;
    }

    if (cachedTheme == 'Dark') {
      return ThemeMode.dark;
    }

    return ThemeMode.system;
  }

  static Future<void> saveCurrentLang(String lang) async {
    await prefs.setString(langKey, lang);
  }

  static String getCurrentLang() {
    final lang = prefs.getString(langKey);

    if (lang == "en" || lang == "ar" || lang == "es") {
      return lang!;
    }

    return "en";
  }
}

 
import 'package:enently/core/theme/app_theme/app_dark_theme.dart';
import 'package:enently/core/theme/app_theme/app_ligth_theme.dart';
import 'package:flutter/material.dart';
   abstract class AppTheme {
  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
  }
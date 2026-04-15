import 'package:enently/core/theme/app_color/app_color_dark.dart';
import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  primaryColor: DarkAppColors.mainColor,
  scaffoldBackgroundColor: DarkAppColors.background,

  appBarTheme: AppBarTheme(
    backgroundColor: DarkAppColors.background,
    foregroundColor: DarkAppColors.mainText,
    centerTitle: true,
  ),

  dividerColor: DarkAppColors.stroke,

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: DarkAppColors.mainColor,
    foregroundColor: DarkAppColors.mainText,
    shape: const CircleBorder(),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DarkAppColors.background,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: DarkAppColors.mainColor,
    unselectedItemColor: DarkAppColors.secondaryText,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  ),

  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.stroke, width: 1.w),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.mainColor, width: 1.w),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.red, width: 1.w),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.red, width: 1.w),
    ),

    fillColor: DarkAppColors.inputs,

    hintStyle: AppTextStyles.bodyMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),

    filled: true,
    prefixIconColor: DarkAppColors.secondaryText,
    suffixIconColor: DarkAppColors.secondaryText,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: REdgeInsets.symmetric(vertical: 9),
      backgroundColor: DarkAppColors.mainColor,
      foregroundColor: DarkAppColors.mainText,
      textStyle: AppTextStyles.titleMedium.copyWith(
        color: DarkAppColors.mainText,
      ),
    ),
  ),

  cardTheme: CardThemeData(
    color: DarkAppColors.inputs,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
      side: BorderSide(color: DarkAppColors.stroke, width: 1.w),
    ),
  ),

  iconTheme: IconThemeData(color: DarkAppColors.mainColor),

  textTheme: TextTheme(
    headlineLarge: AppTextStyles.headlineLarge.copyWith(
      color: DarkAppColors.mainText,
    ),

    titleLarge: AppTextStyles.titleLarge.copyWith(
      color: DarkAppColors.mainText,
    ),

    titleMedium: AppTextStyles.titleMedium.copyWith(
      color: DarkAppColors.mainColor,
    ),

    titleSmall: AppTextStyles.titleSmall.copyWith(
      color: DarkAppColors.mainColor,
    ),

    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: DarkAppColors.mainText),

    bodyMedium: AppTextStyles.bodyMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),

    bodySmall: AppTextStyles.bodySmall.copyWith(
      color: DarkAppColors.secondaryText,
    ),

    labelLarge: AppTextStyles.labelLarge.copyWith(
      color: DarkAppColors.mainText,
    ),

    labelMedium: AppTextStyles.labelMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),

    labelSmall: AppTextStyles.labelSmall.copyWith(
      color: DarkAppColors.mainColor,
    ),
  ),

  colorScheme: ColorScheme.dark(
    primary: DarkAppColors.mainColor,
    secondary: DarkAppColors.stroke,

    surface: DarkAppColors.inputs,
    onSurface: DarkAppColors.mainText,
    error: DarkAppColors.red,
  ),
);

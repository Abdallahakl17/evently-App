import 'package:enently/core/theme/app_color/app_colors_ligth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsLigth.primaryColor,
  scaffoldBackgroundColor: AppColorsLigth.primaryColor,
  fontFamily: 'JannaLT',

  tabBarTheme: TabBarThemeData(
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(
      color: AppColorsLigth.gold,
      borderRadius: BorderRadius.circular(12.r),
    ),
    labelColor: AppColorsLigth.black,
    unselectedLabelColor: AppColorsLigth.white,
    labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
  ),

  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColorsLigth.primaryColor,
    iconTheme: IconThemeData(color: AppColorsLigth.gold, size: 24.sp),
    actionsIconTheme: IconThemeData(color: AppColorsLigth.gold, size: 24.sp),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.gold,
      fontFamily: 'JannaLT',
    ),
  ),

  iconTheme: IconThemeData(color: AppColorsLigth.gold, size: 20.sp),

  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.gold,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.gold,
    ),
    labelLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.black,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.black,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.primaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.primaryColor,
    ),
    titleLarge: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    displayLarge: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorsLigth.gold,
      foregroundColor: AppColorsLigth.primaryColor,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: AppColorsLigth.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      padding: EdgeInsets.all(16.r),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    prefixIconColor: AppColorsLigth.gold,
    hintStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
      fontFamily: 'JannaLT',
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColorsLigth.gold, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColorsLigth.gold, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColorsLigth.gold, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Colors.red, width: 1),
    ),
  ),

  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    tileColor: Colors.transparent,
    textColor: AppColorsLigth.white,
    iconColor: AppColorsLigth.white,
    leadingAndTrailingTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColorsLigth.white,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
  ),

  dividerTheme: DividerThemeData(
    endIndent: 55.w,
    indent: 55.w,
    color: AppColorsLigth.white,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColorsLigth.gold,
    circularTrackColor: AppColorsLigth.gold.withAlpha(50),
  ),
);

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ishraq/core/theme/app_color/app_color_dark.dart';
 
// final ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: AppColorsDark.primaryColor,
//   scaffoldBackgroundColor: AppColorsDark.primaryColor,
//   fontFamily: 'JannaLT',
//   appBarTheme: AppBarTheme(
//     elevation: 0,
//     backgroundColor: AppColorsDark.primaryColor,
//     iconTheme: IconThemeData(
//       color: AppColorsDark.white,
//       size: 24.sp,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: AppColorsDark.white,
//       size: 24.sp,
//     ),
//     titleTextStyle: TextStyle(
//       fontSize: 20.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//     toolbarHeight: 56.h,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         bottom: Radius.circular(16.r),
//       ),
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//   ),
//   iconTheme: IconThemeData(
//     color: AppColorsDark.gold,
//     size: 20.sp,
//   ),
//   textTheme: TextTheme(
//     labelLarge: TextStyle(
//       fontSize: 24.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//     labelMedium: TextStyle(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//     labelSmall: TextStyle(
//       fontSize: 14.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//     titleMedium: TextStyle(
//       fontSize: 20.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColorsDark.gold,
//       foregroundColor: AppColorsDark.primaryColor,
//       textStyle: TextStyle(
//         fontSize: 20.sp,
//         fontWeight: FontWeight.w400,
//         color: AppColorsDark.white,
//         fontFamily: 'JannaLT',
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//       padding: EdgeInsets.all(16.r),
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     isDense: true,
//     filled: true,
//     fillColor: AppColorsDark.primaryColor,
//     hintStyle: TextStyle(
//       color: AppColorsDark.white,
//       fontSize: 16.sp,
//       fontWeight: FontWeight.bold,
//       fontFamily: 'JannaLT',
//     ),
//     contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(color: AppColorsDark.gold, width: 1),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(color: AppColorsDark.gold, width: 1),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(color: AppColorsDark.gold, width: 1),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(color: Colors.red, width: 1),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.r),
//       borderSide: BorderSide(color: Colors.red, width: 1),
//     ),
//   ),
//   listTileTheme: ListTileThemeData(
//     tileColor: Colors.transparent,
//     textColor: AppColorsDark.white,
//     iconColor: AppColorsDark.white,
//     leadingAndTrailingTextStyle: TextStyle(
//       color: AppColorsDark.white,
//       fontFamily: 'JannaLT',
//     ),
//     contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//     dense: true,
//     style: ListTileStyle.drawer,
//   ),
// );
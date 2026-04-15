import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static const fontFamily = "Poppins";

  static final headlineLarge = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static final titleLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static final titleMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static final titleSmall = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static final bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static final bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static final bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static final labelLarge = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static final labelMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  static final labelSmall = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,decoration: TextDecoration.underline
  );
}

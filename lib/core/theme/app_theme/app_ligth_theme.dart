import 'package:enently/core/theme/app_color/app_colors_ligth.dart';
import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightColorScheme = ColorScheme.light(
  // Primary
  primary: LightAppColors.mainColor,
  onPrimary: LightAppColors.white,

  // Secondary
  secondary: LightAppColors.mainColor,
  onSecondary: LightAppColors.white,

  // Surface
  surface: LightAppColors.background,
  onSurface: LightAppColors.mainText,

  // Containers
  surfaceContainerHighest: LightAppColors.inputs,
  surfaceContainer: LightAppColors.inputs,

  // Variants
  onSurfaceVariant: LightAppColors.secondaryText,

  // Outline
  outline: LightAppColors.disable,
  outlineVariant: LightAppColors.stroke,

  // Error
  error: LightAppColors.red,
  onError: LightAppColors.white,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  fontFamily: AppTextStyles.fontFamily,

  //  TextTheme - 
  textTheme: TextTheme(
    // Headlines
    headlineLarge: AppTextStyles.headlineLarge.copyWith(
      color: LightAppColors.mainText,
    ),

    // Titles
    titleLarge: AppTextStyles.titleLarge.copyWith(
      color: LightAppColors.mainText,
    ),
    titleMedium: AppTextStyles.titleMedium.copyWith(
      color: LightAppColors.mainColor,
    ),
    titleSmall: AppTextStyles.titleSmall.copyWith(
      color: LightAppColors.mainColor,
    ),

    // Body
    bodyLarge: AppTextStyles.bodyLarge.copyWith(
      color: LightAppColors.mainText,
    ),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(
      color: LightAppColors.secondaryText,
    ),
    bodySmall: AppTextStyles.bodySmall.copyWith(
      color: LightAppColors.secondaryText,
    ),

    // Labels
    labelLarge: AppTextStyles.labelLarge.copyWith(
      color: LightAppColors.white,
    ),
    labelMedium: AppTextStyles.labelMedium.copyWith(
      color: LightAppColors.secondaryText,
    ),
    labelSmall: AppTextStyles.labelSmall.copyWith(
      color: LightAppColors.mainColor,
      decoration: TextDecoration.underline,
      decorationColor: LightAppColors.mainColor,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: LightAppColors.mainText,
    centerTitle: true,
    titleTextStyle: AppTextStyles.titleLarge.copyWith(
      color: LightAppColors.mainText,
    ),
  ),

  dividerTheme: DividerThemeData(
    color: LightAppColors.stroke,
    thickness: 1,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: LightAppColors.inputs,
    selectedItemColor: LightAppColors.mainColor,
    unselectedItemColor: LightAppColors.secondaryText,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: AppTextStyles.labelSmall,
    unselectedLabelStyle: AppTextStyles.labelSmall,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextStyles.bodyMedium.copyWith(
      color: LightAppColors.secondaryText,
    ),
    filled: true,
    fillColor: LightAppColors.inputs,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: LightAppColors.stroke),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: LightAppColors.mainColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: LightAppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: LightAppColors.red, width: 2),
    ),
    prefixIconColor: LightAppColors.disable,
    suffixIconColor: LightAppColors.disable,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.h),
      backgroundColor: LightAppColors.mainColor,
      foregroundColor: LightAppColors.white,
      textStyle: AppTextStyles.titleMedium.copyWith(
        color: LightAppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),
  ),

  cardTheme: CardThemeData(
    color: LightAppColors.inputs,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(color: LightAppColors.stroke),
    ),
  ),

  iconTheme: IconThemeData(
    color: LightAppColors.mainColor,
  ),
);
import 'package:enently/core/theme/app_color/app_color_dark.dart';
import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final darkColorScheme = ColorScheme.dark(
  // Primary
  primary: DarkAppColors.mainColor,
  onPrimary: DarkAppColors.mainText,

  // Secondary
  secondary: DarkAppColors.mainColor,
  onSecondary: DarkAppColors.mainText,

  // Surface
  surface: DarkAppColors.background,
  onSurface: DarkAppColors.mainText,

  // Containers
  surfaceContainerHighest: DarkAppColors.inputs,
  surfaceContainer: DarkAppColors.inputs,

  // Variants
  onSurfaceVariant: DarkAppColors.secondaryText,

  // Outline
  outline: DarkAppColors.disable,
  outlineVariant: DarkAppColors.stroke,

  // Error
  error: DarkAppColors.red,
  onError: DarkAppColors.mainText,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  fontFamily: AppTextStyles.fontFamily,

  //  TextTheme - مباشرة بدون Builder
  textTheme: TextTheme(
    // Headlines
    headlineLarge: AppTextStyles.headlineLarge.copyWith(
      color: DarkAppColors.mainText,
    ),

    // Titles
    titleLarge: AppTextStyles.titleLarge.copyWith(
      color: DarkAppColors.mainText,
    ),
    titleMedium: AppTextStyles.titleMedium.copyWith(
      color: DarkAppColors.mainColor,
    ),
    titleSmall: AppTextStyles.titleSmall.copyWith(
      color: DarkAppColors.mainColor,
    ),

    // Body
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: DarkAppColors.mainText),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),
    bodySmall: AppTextStyles.bodySmall.copyWith(
      color: DarkAppColors.secondaryText,
    ),

    // Labels
    labelLarge: AppTextStyles.labelLarge.copyWith(
      color: DarkAppColors.mainText,
    ),
    labelMedium: AppTextStyles.labelMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),
    labelSmall: AppTextStyles.labelSmall.copyWith(
      color: DarkAppColors.mainColor,
      decoration: TextDecoration.underline,
      decorationColor: DarkAppColors.mainColor,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    foregroundColor: DarkAppColors.mainText,
    centerTitle: true,
    titleTextStyle: AppTextStyles.titleLarge.copyWith(
      color: DarkAppColors.mainText,
    ),
  ),

  dividerTheme: DividerThemeData(color: DarkAppColors.mainColor, thickness: 1),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DarkAppColors.inputs,
    selectedItemColor: DarkAppColors.mainColor,
    unselectedItemColor: DarkAppColors.secondaryText,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: AppTextStyles.labelSmall,
    unselectedLabelStyle: AppTextStyles.labelSmall,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTextStyles.bodyMedium.copyWith(
      color: DarkAppColors.secondaryText,
    ),
    filled: true,
    fillColor: DarkAppColors.inputs,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.stroke),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.mainColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: DarkAppColors.red, width: 2),
    ),
    prefixIconColor: DarkAppColors.disable,
    suffixIconColor: DarkAppColors.disable,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.h),
      backgroundColor: DarkAppColors.mainColor,
      foregroundColor: DarkAppColors.mainText,
      textStyle: AppTextStyles.titleMedium.copyWith(
        color: DarkAppColors.mainText,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    ),
  ),

  cardTheme: CardThemeData(
    color: DarkAppColors.inputs,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(color: DarkAppColors.stroke),
    ),
  ),

  iconTheme: IconThemeData(color: DarkAppColors.mainColor),
);

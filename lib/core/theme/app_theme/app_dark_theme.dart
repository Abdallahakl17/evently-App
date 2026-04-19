import 'package:enently/core/theme/app_color/app_color_dark.dart';
import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:enently/core/theme/app_text/app_text_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final darkColorScheme = ColorScheme.dark(
  primary: DarkAppColors.mainColor,
  secondary: DarkAppColors.stroke,

  surface: DarkAppColors.background,
  surfaceContainerHighest: DarkAppColors.inputs,
  outlineVariant: DarkAppColors.stroke,
  outline: DarkAppColors.disable,

  error: DarkAppColors.red,
  surfaceContainer: DarkAppColors.inputs,
  onSurface: DarkAppColors.mainText,
  onSurfaceVariant: DarkAppColors.secondaryText,

  onPrimary: DarkAppColors.mainText,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: darkColorScheme,

  scaffoldBackgroundColor: darkColorScheme.surface,

  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    foregroundColor: darkColorScheme.onSurface,
    centerTitle: true,
  ),

  dividerTheme: DividerThemeData(
    color: darkColorScheme.outlineVariant,
    thickness: 1,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: darkColorScheme.surfaceContainerHighest,
    selectedItemColor: darkColorScheme.primary,
    unselectedItemColor: darkColorScheme.onSurfaceVariant,
    type: BottomNavigationBarType.fixed,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 12.sp,
      color: darkColorScheme.onSurfaceVariant,
    ),

    filled: true,
    fillColor: darkColorScheme.surfaceContainerHighest,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: darkColorScheme.secondary),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: darkColorScheme.primary),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: darkColorScheme.error),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: darkColorScheme.error),
    ),

    prefixIconColor: darkColorScheme.outline,
    suffixIconColor: darkColorScheme.outline,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.h),
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,

      textStyle: AppTextStyles.titleMedium.copyWith(
        color: darkColorScheme.onPrimary,
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    ),
  ),

  cardTheme: CardThemeData(
    color: darkColorScheme.surfaceContainerHighest,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
      side: BorderSide(color: darkColorScheme.secondary),
    ),
  ),

  iconTheme: IconThemeData(color: darkColorScheme.primary),

  textTheme: AppTextThemeBuilder.build(darkColorScheme),
);

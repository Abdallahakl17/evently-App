import 'package:enently/core/theme/app_color/app_colors_ligth.dart';
import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:enently/core/theme/app_text/app_text_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final lightColorScheme = ColorScheme.light(
  primary: LightAppColors.mainColor,
  secondary: LightAppColors.stroke,

  surface: LightAppColors.background,
  surfaceContainerHighest: LightAppColors.inputs,
  outlineVariant: LightAppColors.stroke,
  error: LightAppColors.red,
  surfaceContainer: LightAppColors.inputs,
  onSurface: LightAppColors.mainColor,
  onSurfaceVariant: LightAppColors.secondaryText,
  onSecondary: LightAppColors.mainText,
  onPrimary: LightAppColors.inputs,
  outline: LightAppColors.disable,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: lightColorScheme,

  scaffoldBackgroundColor: lightColorScheme.surface,

  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSecondary,
    centerTitle: true,
  ),

  dividerTheme: DividerThemeData(color: LightAppColors.stroke, thickness: 1),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.surfaceContainerHighest,
    selectedItemColor: lightColorScheme.primary,
    unselectedItemColor: lightColorScheme.onSurfaceVariant,
    type: BottomNavigationBarType.fixed,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 12.sp,
      color: lightColorScheme.onSurfaceVariant,
    ),
    filled: true,
    fillColor: lightColorScheme.surfaceContainerHighest,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: lightColorScheme.secondary),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: lightColorScheme.primary),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),

      borderSide: BorderSide(color: lightColorScheme.error),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),

      borderSide: BorderSide(color: lightColorScheme.error),
    ),

    prefixIconColor: lightColorScheme.outline,
    suffixIconColor: lightColorScheme.outline,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.h),

      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,

      textStyle: AppTextStyles.titleMedium.copyWith(
        color: lightColorScheme.onPrimary,
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    ),
  ),

  cardTheme: CardThemeData(
    color: lightColorScheme.surfaceContainerHighest,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
      side: BorderSide(color: lightColorScheme.secondary),
    ),
  ),

  iconTheme: IconThemeData(color: lightColorScheme.primary),

  textTheme: AppTextThemeBuilder.build(lightColorScheme),
);


// 000F30 dark
// F4F7FF ligth
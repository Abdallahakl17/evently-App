import 'package:enently/core/theme/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppTextThemeBuilder {
  static TextTheme build(ColorScheme colors) {
    return TextTheme(
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: colors.primary,
      ),

      titleLarge: AppTextStyles.titleLarge.copyWith(color: colors.onSurface),

      titleMedium: AppTextStyles.titleMedium.copyWith(color: colors.primary),

      titleSmall: AppTextStyles.titleSmall.copyWith(color: colors.primary),

      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: colors.onSurface),

      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: colors.onSurfaceVariant,
      ),

      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: colors.onSurfaceVariant,
      ),

      labelLarge: AppTextStyles.labelLarge.copyWith(color: colors.onSurface),

      labelMedium: AppTextStyles.labelMedium.copyWith(
        color: colors.onSurfaceVariant,
      ),

      labelSmall: AppTextStyles.labelSmall.copyWith(color: colors.primary),
    
    );
  }
}

import 'package:droosy_app/core/bloc/font/font_state.dart';
import 'package:droosy_app/core/services/font_service.dart';
import 'package:droosy_app/core/themes/app_colors.dart';
import 'package:droosy_app/core/themes/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme(FontState fontState) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondaryLight,
        error: AppColors.error,
        surface: AppColors.lightSurface,
      ),
      textTheme: FontService.getCustomTextTheme(
        AppTypography.lightTextTheme,
        fontState.fontFamily,
        fontState.fontSize,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondaryLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightDivider),
        ),
      ),
    );
  }
}

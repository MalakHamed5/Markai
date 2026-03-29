import 'package:ecommerse/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final globalTheme = ThemeData(useMaterial3: true, fontFamily: 'Poppins');

final lightTheme = globalTheme.copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBg,

  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    surface: AppColors.lightSurface,
    onSurface: AppColors.textPrimary,
    error: AppColors.error,
    onError: AppColors.white,
    outline: AppColors.lightBorder,
    surfaceContainerHighest: AppColors.lightCard,
  ),
);

final darkTheme = globalTheme.copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBg,

  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
    error: AppColors.error,
    onError: AppColors.white,
    outline: AppColors.darkBorder,
    surfaceContainerHighest: AppColors.darkCard,
  ),
);

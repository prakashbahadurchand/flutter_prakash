import 'package:flutter/material.dart';

const _seedColor = Color(0xFF003594);
const _yellowColor = Colors.yellow;

enum AppThemeMode { system, light, dark, darkYellow }

ThemeMode applyThemeMode(AppThemeMode appThemeMode) {
  switch (appThemeMode) {
    case AppThemeMode.light:
      return ThemeMode.light;
    case AppThemeMode.dark:
      return ThemeMode.system;
    case AppThemeMode.darkYellow:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

ThemeData lightThemeData() {
  return ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor, brightness: Brightness.light));
}

ThemeData darkThemeData(AppThemeMode appThemeMode) {
  final colorScheme =
  ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark);
  if (appThemeMode == AppThemeMode.dark ||
      appThemeMode == AppThemeMode.system) {
    return ThemeData(useMaterial3: false, colorScheme: colorScheme);
  }
  // Theme For Dark Yellow Text, Icon Everywhere
  return ThemeData(
    useMaterial3: false,
    colorScheme: colorScheme.copyWith(onBackground: _yellowColor),
    textTheme: const TextTheme().apply(
      bodyColor: _yellowColor,
      displayColor: _yellowColor,
    ),
    iconTheme: const IconThemeData(color: _yellowColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: _yellowColor,
      unselectedItemColor: _yellowColor.shade300,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle:
      const TextStyle(fontWeight: FontWeight.bold, color: _yellowColor),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal, color: _yellowColor.shade300),
    ),
  );
}

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3559B7),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDBE1FF),
  onPrimaryContainer: Color(0xFF00174B),
  secondary: Color(0xFF595E72),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDDE1F9),
  onSecondaryContainer: Color(0xFF161B2C),
  tertiary: Color(0xFF3559B7),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFDBE1FF),
  onTertiaryContainer: Color(0xFF00174B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE2E2EC),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF757680),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Color(0xFFB4C5FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF3559B7),
  outlineVariant: Color(0xFFC5C6D0),
  scrim: Color(0xFF000000),
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB4C5FF),
  onPrimary: Color(0xFF002A78),
  primaryContainer: Color(0xFF15409E),
  onPrimaryContainer: Color(0xFFDBE1FF),
  secondary: Color(0xFFC1C5DD),
  onSecondary: Color(0xFF2B3042),
  secondaryContainer: Color(0xFF414659),
  onSecondaryContainer: Color(0xFFDDE1F9),
  tertiary: Color(0xFFB4C5FF),
  onTertiary: Color(0xFF002A78),
  tertiaryContainer: Color(0xFF15409E),
  onTertiaryContainer: Color(0xFFDBE1FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE4E2E6),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC5C6D0),
  outline: Color(0xFF8F909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E2E6),
  inversePrimary: Color(0xFF3559B7),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB4C5FF),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);



/*
import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primaryVariant,
  hintColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primaryVariant,
  hintColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
  ),
);
*/

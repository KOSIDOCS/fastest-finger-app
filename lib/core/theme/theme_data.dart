import 'package:fastest_finger_calculator/core/theme/brand_colors.dart';
import 'package:fastest_finger_calculator/core/theme/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData themeLight = buildLightTheme();

ThemeData buildLightTheme() {
  TextStyle _builtTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  UnderlineInputBorder _buildBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: _buildBorder(BrandColors.kBrandPureWhite),
      errorBorder: _buildBorder(Colors.red),
      focusedBorder: _buildBorder(BrandColors.kBrandSecondary),
      disabledBorder: _buildBorder(BrandColors.kBrandPureWhite),
      errorStyle: _builtTextStyle(Colors.red),
      labelStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      helperStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      hintStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      prefixStyle: _builtTextStyle(BrandColors.kBrandSecondary),
    ),
    backgroundColor: BrandColors.kAppGreyColor,
    scaffoldBackgroundColor: BrandColors.kBrandPureWhite,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: BrandColors.kBrandPureWhite,
      selectedItemColor: BrandColors.kBrandPureWhite,
      unselectedItemColor: BrandColors.kBrandSecondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BrandColors.kBrandPureWhite,
      iconTheme: IconThemeData(
        color: BrandColors.kBrandSecondary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: BrandColors.kBrandPureWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: BrandColors.kBrandSecondary,
    ),
    cardColor: Colors.grey[100],
    canvasColor: BrandColors.kBrandPureWhite,
    brightness: Brightness.light,
    primaryColor: BrandColors.kBrandPureWhite,
    buttonTheme: const ButtonThemeData(
      buttonColor: BrandColors.kBrandSecondary,
      disabledColor: BrandColors.kBrandPureWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: BrandColors.kBrandPureWhite,
      ),
    ),
    dialogBackgroundColor: BrandColors.kBrandPureWhite,
    textTheme: textThemeLight(base.textTheme),
    primaryTextTheme: Typography().black,
    colorScheme: const ColorScheme.light(
      primary: BrandColors.kBrandSecondary,
      surface: BrandColors.kBrandPureWhite,
      background: BrandColors.kBrandPureWhite,
      brightness: Brightness.light,
    ),
  );
}

final ThemeData themeDark = buildDarkTheme();

ThemeData buildDarkTheme() {
  TextStyle _builtTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(color: color, fontSize: size);
  }

  UnderlineInputBorder _buildBorder(Color color) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      enabledBorder: _buildBorder(BrandColors.kBrandPureWhite),
      errorBorder: _buildBorder(Colors.red),
      focusedBorder: _buildBorder(BrandColors.kBrandSecondary),
      disabledBorder: _buildBorder(BrandColors.kBrandPureWhite),
      errorStyle: _builtTextStyle(Colors.red),
      labelStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      helperStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      hintStyle: _builtTextStyle(BrandColors.kBrandSecondary),
      prefixStyle: _builtTextStyle(BrandColors.kBrandSecondary),
    ),
    backgroundColor: const Color(0xFF0b263b),
    scaffoldBackgroundColor: const Color(0xFF0b2742),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: BrandColors.kBrandPureWhite,
      selectedItemColor: BrandColors.kBrandPureWhite,
      unselectedItemColor: BrandColors.kBrandSecondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: BrandColors.kBrandPureWhite,
      iconTheme: IconThemeData(
        color: BrandColors.kBrandSecondary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: BrandColors.kBrandPureWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: BrandColors.kBrandSecondary,
    ),
    cardColor: const Color(0xFF0b2742),
    canvasColor: BrandColors.kBrandPureWhite,
    brightness: Brightness.light,
    primaryColor: BrandColors.kBrandPureWhite,
    buttonTheme: const ButtonThemeData(
      buttonColor: BrandColors.kBrandSecondary,
      disabledColor: BrandColors.kBrandPureWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: BrandColors.kBrandPureWhite,
      ),
    ),
    dialogBackgroundColor: BrandColors.kBrandPureWhite,
    textTheme: textThemeDark(base.textTheme),
    primaryTextTheme: Typography().black,
    colorScheme: const ColorScheme.dark(
      primary: BrandColors.kBrandSecondary,
      surface: BrandColors.kBrandPureWhite,
      background: BrandColors.kBrandPureWhite,
      brightness: Brightness.light,
    ),
  );
}

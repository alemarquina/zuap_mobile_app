import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF0242EC);
  static const Color secondaryColor = Color(0xFF9EFFFC);
  static const Color acentoColor = Color(0xFF7BE583);
  static const Color bgColor = Color(0xFFECEFF1);
  static const Color darkColor = Color(0xFF212121);
  static const Color darkGrayColor = Color(0xFF616161);
  static const Color lightGrayColor = Color(0xFFBDBDBD);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: primaryColor,
        secondary: secondaryColor,
        seedColor: darkColor,
      ),
      fontFamily: 'FontFamilyZuap',
      appBarTheme: const AppBarTheme(
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}

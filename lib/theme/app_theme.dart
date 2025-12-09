import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xFFF8F9FC),
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4461F2),
      secondary: Color(0xFF8E97FD),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFF8F9FC),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D3142),
      ),
    ),
  );
}

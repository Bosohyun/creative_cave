import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightBackgroundColor = Color(0xFFEBF2F1);
  static const Color _darkBackgroundColor = Color(0xFF011140);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: _lightBackgroundColor,
      primary: _darkBackgroundColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: _darkBackgroundColor,
      primary: _lightBackgroundColor,
    ),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightScreenDisplayLargeTextStyle,
  );

  static const TextStyle _lightScreenDisplayLargeTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: _lightBackgroundColor,
    fontFamily: "Roboto",
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkScreenDisplayLargeTextStyle,
  );

  static final TextStyle _darkScreenDisplayLargeTextStyle =
      _lightScreenDisplayLargeTextStyle.copyWith(color: _darkBackgroundColor);
}

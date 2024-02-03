import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightBackgroundColor = Color(0xFFF2F2F2);
  static const Color _darkBackgroundColor = Color(0xFF324037);

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

  static const LinearGradient lightBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromARGB(255, 32, 37, 34),
      Color.fromARGB(255, 32, 37, 34),
      Color.fromARGB(255, 36, 44, 39),
      Color.fromARGB(255, 24, 34, 36),
      Color.fromARGB(255, 44, 37, 28),
      Color.fromARGB(255, 44, 66, 51),
      Color.fromARGB(255, 40, 48, 43),
      Color.fromARGB(255, 47, 59, 52),
      Color.fromARGB(255, 54, 71, 59),
      Color.fromARGB(255, 53, 77, 61),
    ],
  );
}

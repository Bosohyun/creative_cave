import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightBackgroundColor = Color.fromARGB(255, 31, 34, 33);

  static const Color _lightPrimaryColor = Color(0xFFF2F2F2);
  static const Color _lightSecondaryColor = Color.fromARGB(195, 161, 150, 134);
  static const Color _lightTertiaryColor = Color(0xFF010A26);

  static const Color _lightPrimaryContainerColor =
      Color.fromARGB(188, 65, 32, 17);

  static const Color _darkBackgroundColor = Color.fromARGB(255, 31, 34, 33);

  static const Color _darkPrimaryColor = Color(0xFFF2F2F2);
  static const Color _darkSecondaryColor = Color.fromARGB(255, 194, 180, 161);
  static const Color _darkTertiaryColor = Color(0xFF010A26);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        background: _lightBackgroundColor,
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
        tertiary: _lightTertiaryColor,
        primaryContainer: _lightPrimaryContainerColor),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        background: _darkBackgroundColor,
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        tertiary: _darkTertiaryColor,
      ),
      textTheme: _darkTextTheme);

  static final TextTheme _lightTextTheme = TextTheme(
      displayLarge: _lightScreenDisplayLargeTextStyle,
      displayMedium: _lightScreenDisplayMediumTextStyle);

  static final TextStyle _lightScreenDisplayLargeTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: _lightPrimaryColor,
    fontFamily: "Roboto",
  );

  static final TextStyle _lightScreenDisplayMediumTextStyle = TextStyle(
    fontSize: 16.sp,
    color: _lightPrimaryColor,
    fontFamily: "Roboto",
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkScreenDisplayLargeTextStyle,
    displayMedium: _darkScreenDisplayMediumTextStyle,
  );

  static final TextStyle _darkScreenDisplayLargeTextStyle =
      _lightScreenDisplayLargeTextStyle;

  static final TextStyle _darkScreenDisplayMediumTextStyle =
      _lightScreenDisplayMediumTextStyle;

  static const LinearGradient signInBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color.fromARGB(255, 250, 249, 248),
      Color.fromARGB(255, 226, 202, 171),
      Color.fromARGB(255, 228, 201, 166),
      Color.fromARGB(255, 95, 87, 77),
      Color.fromARGB(255, 78, 66, 51),
      Color.fromARGB(255, 44, 66, 51),
      Color.fromARGB(255, 40, 48, 43),
      Color.fromARGB(255, 47, 59, 52),
      Color.fromARGB(255, 54, 71, 59),
      Color.fromARGB(255, 53, 77, 61),
    ],
  );

  static const LinearGradient signUpBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Color.fromARGB(255, 250, 249, 248),
      Color.fromARGB(255, 226, 202, 171),
      Color.fromARGB(255, 121, 111, 98),
      Color.fromARGB(255, 107, 95, 80),
      Color.fromARGB(255, 78, 66, 51),
      Color.fromARGB(255, 44, 66, 51),
      Color.fromARGB(255, 40, 48, 43),
      Color.fromARGB(255, 47, 59, 52),
      Color.fromARGB(255, 54, 71, 59),
      Color.fromARGB(255, 53, 77, 61),
    ],
  );
}

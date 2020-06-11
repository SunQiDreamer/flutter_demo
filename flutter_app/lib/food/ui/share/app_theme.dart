import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;

  static final Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      canvasColor: Colors.red,
      textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: bodyFontSize),
          headline4: TextStyle(fontSize: smallFontSize, color: Colors.black87),
          headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
          headline2: TextStyle(fontSize: largeFontSize, color: Colors.black87),
          headline1: TextStyle(
              fontSize: xlargeFontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w400)));

  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
          bodyText2:
              TextStyle(fontSize: normalFontSize, color: darkTextColors)));
}

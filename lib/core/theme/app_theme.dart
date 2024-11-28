import 'package:flutter/material.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';

class AppTheme {
  static ThemeData get brightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: ThemeColors.blue,
        secondary: ThemeColors.black,
      ),
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Helvetica-medium',
          fontSize: 20.0,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Helvetica-medium',
          fontSize: 16.0,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Helvetica-regular',
          fontSize: 16.0,
        ),
      ),
    );
  }
}

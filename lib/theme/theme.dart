import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final light = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    useMaterial3: true,
  ).copyWith(
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    dividerTheme: _dividerTheme,
  );

  static final dark = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  ).copyWith(
    bottomNavigationBarTheme: _bottomNavigationBarTheme,
    dividerTheme: _dividerTheme,
  );

  static const _bottomNavigationBarTheme = BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
      fontSize: 12,
    ),
  );

  static const _dividerTheme = DividerThemeData(
    space: 0,
  );
}

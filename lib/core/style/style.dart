import 'package:flutter/material.dart';

class Style {
  static ThemeData ThemeStyle() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: const Color(0xFFBF3B3A),
    secondaryHeaderColor: const Color(0xFFbfdeff),
    disabledColor: const Color(0xffa2a7ad),
    brightness: Brightness.dark,
    hintColor: const Color(0xFFbebebe),
    shadowColor: Colors.black.withValues(alpha: 0.4),
    cardColor: const Color(0xFF334257).withValues(alpha: 0.27),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF8e9fb9)),
      titleSmall: TextStyle(color: Color(0xFFe4e8ef)),
    ),
);

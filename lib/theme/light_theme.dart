import 'package:flutter/material.dart';
import 'package:travel_app/src/shared/assets/fonts.gen.dart';

ThemeData light = ThemeData(
    fontFamily: FontFamily.roboto,
    primaryColor: const Color(0xFFA52524),
    secondaryHeaderColor: const Color(0xFF4794FF),
    disabledColor: const Color(0xFFBABFC4),
    brightness: Brightness.light,
    shadowColor: Colors.grey[300],
    hintColor: const Color(0xFF9F9F9F),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF334257)),
      titleSmall: TextStyle(color: Color(0xFF25282D)),
    ),
);

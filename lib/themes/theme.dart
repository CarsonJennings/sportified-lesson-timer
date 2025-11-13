import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
);
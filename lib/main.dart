import 'package:flutter/material.dart';
import 'themes/theme.dart';
import 'screens/drill_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _appTheme = ThemeMode.light;

  void toggleTheme () {
    setState(() {
      _appTheme = _appTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportified Lesson Timer',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: _appTheme,
      home: DrillListScreen(themeToggle: toggleTheme),
    );
  }
}

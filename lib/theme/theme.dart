import 'package:flutter/material.dart';

final myThemeLight = ThemeData.light().copyWith(
  primaryColor: Colors.blue[800],
  hintColor: Colors.blue[900],
  scaffoldBackgroundColor: const Color.fromARGB(255, 246, 246, 246),
  appBarTheme: AppBarTheme(
    elevation: 10,
    color: Colors.blue[800],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: Colors.blue[800],
  ),
);

final myThemeDark = ThemeData.dark().copyWith();

import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1A1A2E),
  scaffoldBackgroundColor: const Color(0xFF1A1A2E),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A2E),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    bodySmall: TextStyle(color: Colors.white54),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF16213E),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white54,
  ),
  cardColor: const Color(0xFF16213E),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0F3460),
    textTheme: ButtonTextTheme.primary,
  ),
);
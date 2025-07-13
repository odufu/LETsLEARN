import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFEFF0F3),
  scaffoldBackgroundColor: const Color(0xFFEFF0F3),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFEFF0F3),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
    bodySmall: TextStyle(color: Colors.black54),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 24,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFD3D4D8),
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black54,
  ),
  cardColor: const Color(0xFFD3D4D8),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFB0B2C0),
    textTheme: ButtonTextTheme.primary,
  ),
);
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.yellow,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 30, 30, 30),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 22,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: Color.fromARGB(255, 100, 100, 100),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
      headlineSmall: TextStyle(
        color: Color.fromARGB(255, 200, 200, 200),
        fontSize: 22,
        fontWeight: FontWeight.w500,
      )
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
);

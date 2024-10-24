import 'package:flutter/material.dart';

Color colorPrimary = Color(0xff685CF0);

ThemeData ligthTheme = ThemeData(
  fontFamily: 'Mulish',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(colorPrimary),
      elevation: WidgetStatePropertyAll(5),
    ),
  ),
  textTheme: TextTheme(
    titleMedium: TextStyle(color: Colors.amber, fontSize: 16),
  ),
);

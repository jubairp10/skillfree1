import 'package:flutter/material.dart';

ThemeData darkTheme =ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade800
  ),
);
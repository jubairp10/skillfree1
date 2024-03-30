import 'package:flutter/material.dart';

ThemeData lightTheme =ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black,)
    ),
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,

    )

);
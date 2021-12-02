import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    dividerColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.dark(primary: primary),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 26.5, fontWeight: FontWeight.bold)),
    primaryTextTheme: const TextTheme(
        headline1: TextStyle(fontSize: 18, color: Colors.white),
        bodyText1: TextStyle(fontSize: 18, color: Colors.white)),
    //  textTheme: const TextTheme(
    //      headline1: TextStyle(fontSize: 18, color: Colors.black)),
    primarySwatch: Colors.blue,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.black,
    primaryColor: Colors.black,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 26.5, fontWeight: FontWeight.bold)),
    primaryTextTheme: const TextTheme(
        headline1: TextStyle(fontSize: 18, color: Colors.black),
        bodyText1: TextStyle(fontSize: 18, color: Colors.black)),
    //  textTheme: const TextTheme(
    //      headline1: TextStyle(fontSize: 18, color: Colors.black)),
    primarySwatch: Colors.blue,
  );
}

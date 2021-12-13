library gblox_mobile.globals;

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

late BluetoothConnection activeConnection;
late BuildContext mainContext;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late ThemeData globalTheme = darkTheme;

void displayToast(String message) {
  Fluttertoast.showToast(
    msg: message,
  );
}

ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff0B0533),
    colorScheme: const ColorScheme(
        primary: Color(0xff0B0533),
        primaryVariant: Color(0xff060841),
        secondary: Color(0xff0000DC),
        secondaryVariant: Color(0xff0000DC),
        surface: Colors.black,
        background: Color(0xff0B0533),
        error: Colors.red,
        onPrimary: Color(0xff0000DC),
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light),
    fontFamily: "Baloo 2",
    backgroundColor: const Color(0xffDEDEF1),
    scaffoldBackgroundColor: const Color(0xff0B0533),
    cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    )),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontFamily: "Baloo 2"),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.blue,
    ));

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xffDEDEF1),
  colorScheme: const ColorScheme(
      primary: Color(0xffDEDEF1),
      primaryVariant: Color(0xffEFEFF2),
      secondary: Color(0xff0000DC),
      secondaryVariant: Color(0xff0000DC),
      surface: Colors.black,
      background: Color(0xffDEDEF1),
      error: Colors.red,
      onPrimary: Color(0xff0000DC),
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.light),
  backgroundColor: const Color(0xffDEDEF1),
  fontFamily: "Baloo 2",
  scaffoldBackgroundColor: const Color(0xffDEDEF1),
  cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16.0),
    ),
  )),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontFamily: "Baloo 2"),
  ).apply(
    bodyColor: const Color(0xff0000DC),
    displayColor: Colors.white,
  ),
);

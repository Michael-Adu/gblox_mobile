library gblox_mobile.globals;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late BluetoothConnection activeConnection;
late BuildContext mainContext;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late ThemeData globalTheme = darkTheme;
late InAppWebViewController? webController;

void displayToast(String message) {
  Fluttertoast.showToast(
    msg: message,
  );
}

double device_width = MediaQuery.of(navigatorKey.currentContext!).size.width;
double device_height = MediaQuery.of(navigatorKey.currentContext!).size.height;
double device_status_bar_height =
    MediaQuery.of(navigatorKey.currentContext!).padding.top;
double cardSize = device_width * 0.6;

class ToolboxClass {
  String name;
  bool category;
  int index;
  String click;
  ToolboxClass(this.name, this.category, this.index, this.click);
}

class CardDetails {
  String svg;
  String title;
  Color textBackgroundColor;
  Function? pressed;
  bool compressSVG;

  CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed,
      this.compressSVG);
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
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 25,
            backgroundColor: Colors.transparent,
            fontFamily: "Baloo 2",
            color: Colors.white)),
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
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Color(0xff0000DC)),
      titleTextStyle: TextStyle(
          fontSize: 25,
          backgroundColor: Colors.transparent,
          fontFamily: "Baloo 2",
          color: Color(0xff0000DC))),
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

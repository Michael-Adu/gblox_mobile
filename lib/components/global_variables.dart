library gblox_mobile.globals;

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';

late BluetoothConnection activeConnection;
late BuildContext mainContext;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void displayToast(String message) {
  Fluttertoast.showToast(
    msg: message,
  );
}

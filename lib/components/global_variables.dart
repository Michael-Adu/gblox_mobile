library gblox_mobile.globals;

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

late BluetoothConnection activeConnection;
late BuildContext mainContext;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

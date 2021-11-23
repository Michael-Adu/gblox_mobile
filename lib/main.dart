import 'package:control_pad/models/pad_button_item.dart';
import 'package:control_pad/views/circle_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:control_pad/control_pad.dart';

void main() {
  runApp(GbloxApp());
}

class GbloxApp extends StatelessWidget {
  const GbloxApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('gBlox Mobile Home'),
                  centerTitle: true,
                ),
                drawer: Drawer(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                      ),
                      child: Text('gBlox Mobile'),
                    ),
                    ListTile(
                      title: const Text('Blockly'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Blockly()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Controller'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Controller()),
                        );
                      },
                    ),
                  ],
                )))));
  }
}

class Blockly extends StatelessWidget {
  const Blockly({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Blockly"), centerTitle: true),
            body: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html',
              onWebViewCreated: (controller) {
                controller.loadUrl(
                    'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html');
              },
            )));
  }
}

double varDegress = 0.0;
double varDistance = 0.0;

class Controller extends StatelessWidget {
  const Controller({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Controller")),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: JoystickView(
              onDirectionChanged: (double degrees, double distanceFromCenter) {
            varDegress = degrees;
            varDistance = distanceFromCenter;
            print(varDegress.toString());
            print(varDistance.toString());
          }),
        ),
        Container(
          child: PadButtonsView(
            backgroundPadButtonsColor: Colors.blue,
            buttons: const [
              PadButtonItem(index: 1, backgroundColor: Colors.red),
              PadButtonItem(index: 2, backgroundColor: Colors.yellow),
              PadButtonItem(index: 3, backgroundColor: Colors.green),
              PadButtonItem(index: 4, backgroundColor: Colors.blue),
            ],
            buttonsPadding: 10,
          ),
        ),
      ]),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:control_pad/models/pad_button_item.dart';
import 'package:control_pad/views/circle_view.dart';
import 'package:control_pad/control_pad.dart';

double varDegress = 0.0;
double varDistance = 0.0;

class Controller extends StatelessWidget {
  @override
  const Controller({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Controller")),
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
          width: 200,
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

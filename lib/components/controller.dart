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
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Controller"),
              centerTitle: true,
              backgroundColor: Colors.transparent),
          body:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            JoystickView(
              onDirectionChanged: (double degrees, double distanceFromCenter) {
                varDegress = degrees;
                varDistance = distanceFromCenter;
                print("Degrees: " + varDegress.toString());
                print("Distance: " + varDistance.toString());
              },
              backgroundColor: const Color(0xff0000DC),
              innerCircleColor: Colors.white,
              iconsColor: Colors.white,
            ),
            Container(
                width: 220,
                margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                            child: Icon(Icons.speaker, color: Colors.black),
                            width: 100,
                            color: Colors.white),
                        onTap: () {
                          print("Speaker");
                        },
                      ),
                      InkWell(
                        child: Container(
                            child: Icon(Icons.light, color: Colors.black),
                            width: 100,
                            color: Colors.white),
                        onTap: () {
                          print("Lights");
                        },
                      )
                    ])),
            PadButtonsView(
              backgroundPadButtonsColor: const Color(0xff0000DC),
              buttons: const [
                PadButtonItem(
                    index: 1,
                    backgroundColor: Colors.red,
                    buttonIcon: Icon(Icons.arrow_forward, color: Colors.white)),
                PadButtonItem(
                    index: 2,
                    backgroundColor: Colors.yellow,
                    buttonIcon:
                        Icon(Icons.arrow_downward, color: Colors.white)),
                PadButtonItem(
                    index: 3,
                    backgroundColor: Colors.green,
                    buttonIcon: Icon(Icons.arrow_back, color: Colors.white)),
                PadButtonItem(
                    index: 4,
                    backgroundColor: Colors.blue,
                    buttonIcon: Icon(Icons.arrow_upward, color: Colors.white)),
              ],
              padButtonPressedCallback: (buttonIndex, gesture) {
                {
                  switch (buttonIndex) {
                    case 1:
                      print("I pressed 1");
                      break;
                    case 2:
                      print("I pressed 2");
                      break;
                    case 3:
                      print("I pressed 3");
                      break;
                    case 4:
                      print("I pressed 4");
                      break;
                    default:
                      break;
                  }
                }
              },
              buttonsPadding: 10,
            ),
          ]),
        ));
  }
}

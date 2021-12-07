import 'package:flutter/material.dart';
import 'dart:async';
import 'package:control_pad/control_pad.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'Button/buttons.dart';
import 'global_variables.dart' as global;
import 'g_blox_custom_s_v_gs_icons.dart';
import 'speedmeter.dart';

double varDegress = 0.0;
double varDistance = 0.0;

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ControllerState();
  }
}

class _ControllerState extends State<Controller> {
  _ControllerState();

  void printval() {
    print("Test");
  }

  bool _connectedDevice = false;
  Color _connectedColor = const Color(0xff3E3B73);

  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      try {
        if (global.activeConnection.isConnected) {
          setState(() {
            _connectedDevice = true;
            _connectedColor = const Color(0xffffffff);
          });
        } else {
          setState(() {
            _connectedDevice = false;
            _connectedColor = const Color(0xff3E3B73);
          });
        }
      } catch (e) {}
      print(global.activeConnection.isConnected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              JoystickView(
                onDirectionChanged:
                    (double degrees, double distanceFromCenter) {
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
                  width: 300,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Speedometer(speed: 10),
                        GBloxButtons(
                            buttonType: "controller_circle",
                            icon: Icon(GBloxCustomSVGs.gBloxLogo,
                                color: _connectedDevice
                                    ? Color(0xffffffff)
                                    : Color(0xffff0000),
                                size: 30),
                            pressed: () {},
                            buttonColor: 0xff1D184B),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GBloxButtons(
                                buttonType: "controller_square",
                                icon: const Icon(GBloxCustomSVGs.horn,
                                    color: Color(0xffE2D424), size: 30),
                                pressed: () {
                                  print("Horn Pressed");
                                  try {
                                    global.activeConnection.output.add(
                                        Uint8List.fromList(utf8.encode("a")));
                                    print(global.activeConnection);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                buttonColor: 0xE2D424,
                              ),
                              GBloxButtons(
                                buttonType: "controller_square",
                                icon: const Icon(GBloxCustomSVGs.headlights,
                                    color: Color(0xffE2D424), size: 30),
                                pressed: () {
                                  print("Lights Toggled");
                                  try {
                                    global.activeConnection.output.add(
                                        Uint8List.fromList(
                                            utf8.encode("led 1 0 0")));
                                    print(global.activeConnection);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                buttonColor: 0xE2D424,
                              )
                            ])
                      ])),
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 150,
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    child: GBloxButtons(
                        buttonType: "controller_circle",
                        icon: const Icon(GBloxCustomSVGs.forwardMovement,
                            color: Colors.white),
                        pressed: printval,
                        buttonColor: 0xffDB8000),
                    top: 0,
                    right: 75,
                  ),
                  Positioned(
                    child: GBloxButtons(
                        buttonType: "controller_circle",
                        icon: const Icon(GBloxCustomSVGs.rotateMovement,
                            color: Colors.white),
                        pressed: printval,
                        buttonColor: 0xff1F81E5),
                    top: 55,
                    right: 140,
                  ),
                  Positioned(
                    child: GBloxButtons(
                        buttonType: "controller_circle",
                        icon: const Icon(GBloxCustomSVGs.group_23,
                            color: Colors.white),
                        pressed: printval,
                        buttonColor: 0xff3EA52C),
                    top: 110,
                    left: 55,
                  ),
                  Positioned(
                    child: GBloxButtons(
                        buttonType: "controller_circle",
                        icon: const Icon(GBloxCustomSVGs.randomMovement,
                            color: Colors.white),
                        pressed: printval,
                        buttonColor: 0xffA62AB5),
                    //
                    top: 55,
                    left: 125,
                  )
                ]),
              )
            ])));
  }
}

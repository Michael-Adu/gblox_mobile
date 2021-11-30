import 'package:flutter/material.dart';
import 'package:control_pad/models/pad_button_item.dart';
import 'package:control_pad/views/circle_view.dart';
import 'package:control_pad/control_pad.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'Button/buttons.dart';
import 'global_variables.dart' as global;
import 'g_blox_custom_s_v_gs_icons.dart';

double varDegress = 0.0;
double varDistance = 0.0;

class Controller extends StatelessWidget {
  @override
  const Controller({Key? key}) : super(key: key);

  void printval() {
    print("Test");
  }

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
                      width: 250,
                      margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GBloxButtons(
                              buttonType: "controller_square",
                              icon: const Icon(GBloxCustomSVGs.path_72,
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
                              icon: const Icon(GBloxCustomSVGs.group_26,
                                  color: Color(0xffE2D424), size: 30),
                              pressed: () {
                                print("Lights Toggled");
                                try {
                                  global.activeConnection.output.add(
                                      Uint8List.fromList(utf8.encode("b")));
                                  print(global.activeConnection);
                                } catch (e) {
                                  print(e);
                                }
                              },
                              buttonColor: 0xE2D424,
                            )
                          ])),
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 150,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Positioned(
                        child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: const Icon(GBloxCustomSVGs.group_22,
                                color: Colors.white),
                            pressed: printval,
                            buttonColor: 0xffDB8000),
                        top: 0,
                        right: 75,
                      ),
                      Positioned(
                        child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: const Icon(GBloxCustomSVGs.group_21,
                                color: Colors.white),
                            pressed: printval,
                            buttonColor: 0xff1F81E5),
                        top: 50,
                        right: 140,
                      ),
                      Positioned(
                        child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: const Icon(GBloxCustomSVGs.group_23,
                                color: Colors.white),
                            pressed: printval,
                            buttonColor: 0xff3EA52C),
                        top: 100,
                        left: 60,
                      ),
                      Positioned(
                        child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: const Icon(GBloxCustomSVGs.path_56,
                                color: Colors.white),
                            pressed: printval,
                            buttonColor: 0xffA62AB5),
                        top: 50,
                        left: 125,
                      )
                    ]),
                  )
                ])));
  }
}

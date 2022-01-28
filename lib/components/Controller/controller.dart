import 'dart:convert';
import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../global_variables.dart' as global;
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import 'speedometer.dart';

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
  var currentSpeed = ValueNotifier<double>(0);

  void printval() {
    print("Test");
  }

  bool _connectedDevice = false;
  Color _connectedColor = const Color(0xff3E3B73);

  void initState() {
    super.initState();
    try {
      if (global.activeConnection.isConnected) {
        setState(() {
          _connectedDevice = true;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
                title: Text("controller_drawer",
                        style: TextStyle(fontSize: global.deviceText.title))
                    .tr(),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: JoystickView(
                        interval: const Duration(milliseconds: 100),
                        onDirectionChanged:
                            (double degrees, double distanceFromCenter) {
                          varDegress = degrees;
                          varDistance = distanceFromCenter;
                          print("Degrees: " + varDegress.toString());
                          print("Distance: " + varDistance.toString());
                          currentSpeed.value = 15 * varDistance;
                        },
                        backgroundColor: const Color(0xff0000DC),
                        innerCircleColor: Colors.white,
                        iconsColor: Colors.white,
                        size: global.device_size.width * 0.27,
                      )),
                  Container(
                      width: global.device_size.width * 0.3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(
                                valueListenable: currentSpeed,
                                builder: (context, value, widget) {
                                  return Speedometer(speed: currentSpeed);
                                }),
                            SizedBox(
                              width: global.device_size.height * 0.2,
                              height: global.device_size.height * 0.2,
                              child: GBloxButtons(
                                  buttonType: "controller_circle",
                                  icon: GBloxCustomSVGs.gBloxLogo,
                                  pressed: () {},
                                  buttonColor: 0xff1D184B),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: global.device_size.width * 0.1,
                                    child: GBloxButtons(
                                      buttonType: "controller_square",
                                      icon: GBloxCustomSVGs.horn,
                                      pressed: () {
                                        print("Horn Pressed");
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(
                                                  utf8.encode("a")));
                                          print(global.activeConnection);
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      buttonColor: 0xff1D184B,
                                    ),
                                  ),
                                  Container(
                                      width: global.device_size.width * 0.1,
                                      child: GBloxButtons(
                                        buttonType: "controller_square",
                                        icon: GBloxCustomSVGs.headlights,
                                        pressed: () {
                                          print("Lights Toggled");
                                          try {
                                            global.activeConnection.output.add(
                                                Uint8List.fromList(
                                                    utf8.encode("b")));
                                            print(global.activeConnection);
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        buttonColor: 0xff1D184B,
                                      ))
                                ])
                          ])),
                  Container(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      width: global.device_size.width * 0.3,
                      height: global.device_size.height * 0.5,
                      child: Container(
                          clipBehavior: Clip.none,
                          child: Transform.rotate(
                              angle: -math.pi / 4,
                              child: Container(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  width: global.device_size.width * 0.22,
                                  height: global.device_size.height * 0.3,
                                  child: GridView(
                                    clipBehavior: Clip.none,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.0,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.forwardMovement,
                                          pressed: printval,
                                          buttonColor: 0xffDB8000,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.rotateMovement,
                                          pressed: () async {
                                            global.displayToast(currentSpeed
                                                .value
                                                .toInt()
                                                .toString());
                                          },
                                          buttonColor: 0xff1F81E5,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.group_23,
                                          pressed: printval,
                                          buttonColor: 0xff3EA52C,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.randomMovement,
                                          pressed: () async {},
                                          buttonColor: 0xffA62AB5,
                                          rotate: true,
                                        ),
                                      )
                                    ],
                                  )))))
                ])));
  }
}

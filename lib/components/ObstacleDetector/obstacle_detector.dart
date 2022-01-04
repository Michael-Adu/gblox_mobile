import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../Modular_Widgets/Switch/switch.dart';
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;
import 'dart:math' as math;

class ObstacleDetector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ObstacleDetectorState();
  }
}

class _ObstacleDetectorState extends State<ObstacleDetector> {
  @override
  bool _state = false;
  List<Widget> falseState = [
    Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: SvgPicture.string(svgs.light_detector_away,
            height: global.device_height * 0.25)),
    SvgPicture.string(svgs.light_detector_away,
        height: global.device_height * 0.25),
  ];
  List<Widget> trueState = [
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_height * 0.25),
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_height * 0.25),
  ];

  late List<Widget> stateWidget = List<Widget>.empty(growable: true);

  void initState() {
    super.initState();
    stateWidget = falseState;
  }

  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('obstacle_play').tr(),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    width: global.device_width * 0.5,
                    height: global.device_height * 1,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Container(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          child: Transform(
                              transform: Matrix4.diagonal3Values(1.5, 1.5, 1),
                              child: SvgPicture.string(
                                svgs.obstacle_detect,
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                              ))),
                      Container(
                          clipBehavior: Clip.none,
                          width: global.device_width * 0.5,
                          margin: EdgeInsets.fromLTRB(
                              global.device_width * 0.1,
                              global.device_height * 0.3,
                              global.device_width * 0.35,
                              0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: stateWidget,
                          ))
                    ])),
                Container(
                    alignment: Alignment.center,
                    child: GBloxSwitch(
                      icons: const [
                        GBloxCustomSVGs.followobstacle,
                        GBloxCustomSVGs.avoidobstacle
                      ],
                      switchedFunctions: [
                        () {
                          setState(() {
                            stateWidget = trueState;
                          });
                        },
                        () {
                          setState(() {
                            stateWidget = falseState;
                          });
                        }
                      ],
                    ))
              ],
            ))));
  }
}

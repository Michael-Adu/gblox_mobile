import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../Modular_Widgets/Switch/switch.dart';
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;
import 'dart:math' as math;

class LightDetector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LightDetectorState();
  }
}

class _LightDetectorState extends State<LightDetector> {
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
              title: const Text('light_play').tr(),
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
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(
                        0, global.device_height * 0.12, 0, 0),
                    width: global.device_width * 0.5,
                    height: global.device_height * 0.6,
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                          child: SvgPicture.string(svgs.light_detector,
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              fit: BoxFit.cover)),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(
                              0, 0, 0, global.device_height * 0.2),
                          width: global.device_width * 0.16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: stateWidget,
                          ))
                    ])),
                Container(
                    alignment: Alignment.center,
                    child: GBloxSwitch(
                      icons: const [
                        GBloxCustomSVGs.followLight,
                        GBloxCustomSVGs.avoidLight
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

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
            height: global.device_size.height * 0.25)),
    SvgPicture.string(svgs.light_detector_away,
        height: global.device_size.height * 0.25),
  ];
  List<Widget> trueState = [
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_size.height * 0.25),
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_size.height * 0.25),
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
              title: Text('light_play',
                      style:
                          TextStyle(fontSize: global.deviceText.title))
                  .tr(),
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
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    width: global.device_size.width * 0.5,
                    height: global.device_size.height * 0.95,
                    child: Stack(alignment: Alignment.center, children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.string(svgs.light_detector,
                              alignment: Alignment.topCenter,
                              clipBehavior: Clip.none,
                              allowDrawingOutsideViewBox: true,
                              height: global.device_size.height * 1,
                              fit: BoxFit.none)),
                      Container(
                          alignment: Alignment.center,
                          width: global.device_size.width * 0.4,
                          height: global.device_size.height * 0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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

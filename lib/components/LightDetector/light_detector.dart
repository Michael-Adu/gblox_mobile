import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../Modular_Widgets/Switch/switch.dart';
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;

class LightDetector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LightDetectorState();
  }
}

class _LightDetectorState extends State<LightDetector> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('light_play').tr(),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: SvgPicture.string(svgs.light_detector,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        fit: BoxFit.cover),
                    width: 350,
                    height: 400),
                GBloxSwitch(
                  icons: const [
                    GBloxCustomSVGs.followLight,
                    GBloxCustomSVGs.avoidLight
                  ],
                )
              ],
            ))));
  }
}

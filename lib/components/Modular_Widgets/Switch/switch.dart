import 'package:flutter/material.dart';
import 'package:gblox_mobile/components/Modular_Widgets/Button/buttons.dart';
import '../../svgs/g_blox_custom_s_v_gs_icons.dart';
import '../../global_variables.dart' as global;

class GBloxSwitch extends StatefulWidget {
  late List<IconData>? icons;
  @required
  late final List<Function>? switchedFunctions;

  GBloxSwitch({Key? key, this.icons, this.switchedFunctions}) : super(key: key);

  @override
  _GBloxSwitchState createState() => _GBloxSwitchState();
}

class _GBloxSwitchState extends State<GBloxSwitch> {
  late List<IconData> switchIcons = [
    GBloxCustomSVGs.followLight,
    GBloxCustomSVGs.avoidLight
  ];
  bool _state = false;

  void initState() {
    if ((widget.icons?.isEmpty) == false) {
      switchIcons = widget.icons!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 10),
        width: 200,
        decoration: const BoxDecoration(
          color: Color(0xff060227),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 10),
                child: GBloxButtons(
                  buttonType: "controller_circle",
                  icon: switchIcons[0],
                  buttonColor: _state ? 0xff3EA52C : 0xff060841,
                  pressed: () {
                    try {
                      widget.switchedFunctions![0]();
                    } catch (e) {}
                    global.displayToast("Switching to On");
                    setState(() {
                      _state = true;
                    });
                  },
                )),
            AnimatedContainer(
                duration: const Duration(milliseconds: 10),
                child: GBloxButtons(
                  buttonType: "controller_circle",
                  icon: switchIcons[1],
                  buttonColor: _state ? 0xff060841 : 0xffDD0A18,
                  pressed: () {
                    try {
                      widget.switchedFunctions![1]();
                    } catch (e) {}

                    global.displayToast("Switching to Off");
                    setState(() {
                      _state = false;
                    });
                  },
                ))
          ],
        ));
  }
}

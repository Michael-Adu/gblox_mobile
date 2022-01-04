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
  ValueNotifier<bool> state = ValueNotifier<bool>(false);
  List<Function> switchedFunctions = List<Function>.empty(growable: true);

  @override
  void initState() {
    if ((widget.icons?.isEmpty) == false) {
      switchIcons = widget.icons!;
    }
    try {
      switchedFunctions = widget.switchedFunctions!;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: state,
        builder: (context, value, widget) {
          return AnimatedContainer(
              duration: const Duration(milliseconds: 10),
              decoration: const BoxDecoration(
                color: Color(0xff060227),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              padding: const EdgeInsets.all(10),
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                          width: global.device_height * 0.2,
                          height: global.device_height * 0.2,
                          duration: const Duration(milliseconds: 10),
                          padding: EdgeInsets.all(global.device_width * 0.01),
                          child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: switchIcons[0],
                            buttonColor: state.value ? 0xff3EA52C : 0xff060841,
                            pressed: () {
                              state.value = true;
                              try {
                                switchedFunctions[0]();
                              } catch (e) {}
                            },
                          )),
                      AnimatedContainer(
                          width: global.device_height * 0.2,
                          height: global.device_height * 0.2,
                          duration: const Duration(milliseconds: 10),
                          padding: EdgeInsets.all(global.device_width * 0.01),
                          child: GBloxButtons(
                            buttonType: "controller_circle",
                            icon: switchIcons[1],
                            buttonColor: state.value ? 0xff060841 : 0xffDD0A18,
                            pressed: () {
                              state.value = false;
                              try {
                                switchedFunctions[1]();
                              } catch (e) {}
                            },
                          ))
                    ],
                  )));
        });
  }
}

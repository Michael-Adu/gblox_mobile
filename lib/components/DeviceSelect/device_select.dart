import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../Modular_Widgets/Cards/cards.dart';
import '../Menus/ModeSelector/mode_select.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;

class DeviceSelect extends StatefulWidget {
  final bool isHome;
  DeviceSelect({Key? key, this.isHome = true}) : super(key: key);
  @override
  _DeviceSelectState createState() => _DeviceSelectState();
}

class _DeviceSelectState extends State<DeviceSelect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("select_device_page").tr(),
              centerTitle: true,
            ),
            body: Container(
                alignment: Alignment.center,
                height: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 220,
                      child: GBloxCards(
                        svg: svgs.mingo,
                        pressed: () {
                          global.selectedDevice = "Mingo";
                          if (widget.isHome) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ModeSelector()));
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        text: "Mingo",
                        textBackgroundColor: Color(0xff8D00E8),
                        compressSVG: false,
                      ),
                    ),
                    Container(
                      height: 220,
                      child: GBloxCards(
                        svg: svgs.mello,
                        pressed: () {
                          global.selectedDevice = "Mello";
                          if (widget.isHome) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ModeSelector()));
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        text: "Mello",
                        textBackgroundColor: Color(0xff40BF4A),
                        compressSVG: false,
                      ),
                    )
                  ],
                ))));
  }
}

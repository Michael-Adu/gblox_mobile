import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../Modular_Widgets/Cards/cards.dart';
import '../Menus/ModeSelector/mode_select.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;

class DeviceSelect extends StatefulWidget {
  final bool isHome;
  DeviceSelect({
    Key? key,
    this.isHome = true,
  }) : super(key: key);
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
              title: Text("select_device_page",
                      style: TextStyle(fontSize: global.device_height * 0.04))
                  .tr(),
              centerTitle: true,
            ),
            body: Container(
                padding: EdgeInsets.all(global.device_height * 0.1),
                height: global.device_height * 0.8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
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
                    Expanded(
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

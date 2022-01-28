import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Modular_Widgets/Cards/cards.dart';
import '../Menus/ModeMenu/mode_menu.dart';
import '../Menus/CodeMenu/code_menu.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;

class DeviceSelect extends StatefulWidget {
  final bool isHome;
  final bool fullPage;
  const DeviceSelect({Key? key, this.isHome = true, this.fullPage = true})
      : super(key: key);
  @override
  _DeviceSelectState createState() => _DeviceSelectState();
}

class _DeviceSelectState extends State<DeviceSelect> {
  @override
  Widget build(BuildContext context) {
    if (widget.fullPage) {
      return MaterialApp(
          theme: Theme.of(global.navigatorKey.currentContext!),
          home: Scaffold(
              appBar: AppBar(
                title: Text("select_device_page",
                        style: TextStyle(fontSize: global.deviceText.title))
                    .tr(),
                centerTitle: true,
                leading: widget.isHome
                    ? Container()
                    : IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
              ),
              body: Container(
                  padding: EdgeInsets.all(global.device_size.height * 0.1),
                  height: global.device_size.height * 0.8,
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
                                      builder: (context) => ModeMenu()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CodeMenu()));
                            }
                          },
                          text: "Mingo",
                          textBackgroundColor: Color(0xff8D00E8),
                          compressSVG: false,
                        ),
                      ),
                      Expanded(
                        child: GBloxCards(
                          svg: svgs.arduino,
                          pressed: () {
                            global.selectedDevice = "Arduino Uno";
                            if (widget.isHome) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModeMenu()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CodeMenu()));
                            }
                          },
                          text: "Arduino",
                          textBackgroundColor: Color(0xff40BF4A),
                          compressSVG: false,
                        ),
                      )
                    ],
                  ))));
    } else {
      return Container(
          padding: EdgeInsets.all(global.device_size.height * 0.1),
          height: global.device_size.height * 0.8,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ModeMenu()));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CodeMenu()));
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ModeMenu()));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CodeMenu()));
                    }
                  },
                  text: "Mello",
                  textBackgroundColor: Color(0xff40BF4A),
                  compressSVG: false,
                ),
              )
            ],
          ));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rive/rive.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../global_variables.dart' as global;

class PathFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PathFinderState();
  }
}

class _PathFinderState extends State<PathFinder> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: Text('path_play',
                      style: TextStyle(fontSize: global.deviceText.title))
                  .tr(),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: RiveAnimation.asset(
                          'assets/animationFiles/pathFinder.riv',
                        ),
                        width: global.device_size.width * 0.65,
                        height: global.device_size.height * 0.75),
                    Container(
                        width: global.device_size.width * 0.1,
                        height: global.device_size.height * 0.2,
                        child: GBloxButtons(
                          buttonType: "controller_circle",
                          icon: Icons.play_arrow,
                          pressed: () {
                            global.displayToast(
                                "This feature has not been implemented yet.");
                          },
                          buttonColor: 0xff3EA52C,
                        ))
                  ],
                )))));
  }
}

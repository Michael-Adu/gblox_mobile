import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../svgs/svgs.dart' as svgs;
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
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('path_play').tr(),
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
                    child: SvgPicture.string(
                      svgs.pathFinder,
                      alignment: Alignment.center,
                    ),
                    width: 500,
                    height: 400),
                GBloxButtons(
                  buttonType: "controller_circle",
                  icon: Icons.play_arrow,
                  pressed: () {
                    global.displayToast(
                        "This feature has not been implemented yet.");
                  },
                  buttonColor: 0xff3EA52C,
                )
              ],
            ))));
  }
}

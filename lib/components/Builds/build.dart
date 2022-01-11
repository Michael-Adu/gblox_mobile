import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../Modular_Widgets/Cards/cards.dart';
import 'build_data.dart';
import '../svgs/svgs.dart' as svgs;
import '../global_variables.dart' as global;

class GBloxBuild extends StatefulWidget {
  const GBloxBuild({Key? key}) : super(key: key);
  @override
  _GBloxBuildState createState() => _GBloxBuildState();
}

class _GBloxBuildState extends State<GBloxBuild> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: Text("build_mode",
                      style: TextStyle(fontSize: global.device_height * 0.04))
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Builddata()),
                          );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Builddata()),
                          );
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

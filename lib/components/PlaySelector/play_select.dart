import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Cards/cards.dart';
import '../svgs/svgs.dart' as svgs;
import '../controller.dart';
import '../piano.dart';
import '../SketchingTool/sketcher.dart';
import '../ConnectingPage/connection_in_progress.dart';

class PlaySelector extends StatefulWidget {
  const PlaySelector({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PlaySelector();
  }
}

class _PlaySelector extends State<PlaySelector> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("play_select_page").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Stack(children: [
              SvgPicture.string(
                svgs.pageCityBackground,
                alignment: Alignment.bottomCenter,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GBloxCards(
                              svg: svgs.drivePlay,
                              text: "drive_play",
                              textBackgroundColor: Colors.red,
                              pressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Controller()),
                                );
                              },
                            ),
                            GBloxCards(
                                svg: svgs.pathFinderPlay,
                                text: "path_play",
                                textBackgroundColor: Colors.green,
                                pressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConnectionInProgress()),
                                  );
                                }),
                            GBloxCards(
                                svg: svgs.lightDetectorPlay,
                                text: "light_play",
                                textBackgroundColor: Colors.orange,
                                pressed: () {
                                  print("Light Finder selected");
                                }),
                            GBloxCards(
                                svg: svgs.pianoPlay,
                                text: "piano_play",
                                textBackgroundColor: Colors.purple,
                                pressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const PianoApp()),
                                  );
                                }),
                            GBloxCards(
                                svg: svgs.drawFollowPlay,
                                text: "drawFollow_play",
                                textBackgroundColor: const Color(0xffFA857B),
                                pressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SketcherWidget()),
                                  );
                                })
                          ])))
            ]))));
  }
}

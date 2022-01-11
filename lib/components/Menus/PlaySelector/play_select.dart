import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gblox_mobile/components/Piano/piano_keys.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../Modular_Widgets/Cards/cards.dart';
import '../../svgs/svgs.dart' as svgs;
import '../../global_variables.dart' as global;
import '../../Controller/controller.dart';
import '../../Piano/piano_keys.dart';
import '../../SketchingTool/sketcher.dart';
import '../../Bluetooth/connection_in_progress.dart';
import '../../PathFinder/path_finder.dart';
import '../../LightDetector/light_detector.dart';
import '../../ObstacleDetector/obstacle_detector.dart';

class PlaySelector extends StatefulWidget {
  const PlaySelector({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PlaySelector();
  }
}

class _PlaySelector extends State<PlaySelector> {
  List<global.CardDetails> playCards =
      List<global.CardDetails>.empty(growable: true);
  int _focusedIndex = 0;

  void initState() {
    super.initState();
    playCards
        .add(global.CardDetails(svgs.drivePlay, "drive_play", Colors.red, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Controller()),
      );
    }, true));
    playCards.add(global.CardDetails(
        svgs.obstacle_detector, "obstacle_play", const Color(0xff4CBFE6), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ObstacleDetector()),
      );
    }, true));
    playCards.add(
        global.CardDetails(svgs.pathFinderPlay, "path_play", Colors.green, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PathFinder()),
      );
    }, true));
    playCards.add(global.CardDetails(
      svgs.lightDetectorPlay,
      "light_play",
      Colors.orange,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LightDetector()),
        );
      },
      true,
    ));
    playCards.add(
        global.CardDetails(svgs.pianoPlay, "piano_play", Colors.purple, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PianoKeys()),
      );
    }, true));
    playCards.add(global.CardDetails(
        svgs.drawFollowPlay, "drawFollow_play", const Color(0xffFA857B), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SketcherWidget()),
      );
    }, true));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
        width: global.cardSize,
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: GBloxCards(
                svg: playCards[index].svg,
                text: playCards[index].title,
                textBackgroundColor: playCards[index].textBackgroundColor,
                pressed: playCards[index].pressed,
                compressSVG: playCards[index].compressSVG)));
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
                title: Text("play_select_page",
                        style: TextStyle(fontSize: global.device_height * 0.04))
                    .tr(),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
            body: Container(
                alignment: Alignment.center,
                child: Stack(children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.string(
                      svgs.pageCityBackground,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Container(
                      height: global.device_height * 0.8,
                      padding: EdgeInsets.fromLTRB(
                          0,
                          global.device_height * 0.1,
                          0,
                          global.device_height * 0.1),
                      width: global.device_width * 1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: ScrollSnapList(
                                onItemFocus: _onItemFocus,
                                dynamicItemSize: true,
                                itemSize: global.cardSize,
                                dynamicItemOpacity: 0.5,
                                duration: 100,
                                focusOnItemTap: true,
                                itemBuilder: _buildListItem,
                                itemCount: playCards.length,
                                reverse: true,
                                initialIndex: playCards.length.toDouble(),
                              ),
                            ),
                          ]))
                ])))));
  }
}

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../Modular_Widgets/Cards/cards.dart';
import '../../svgs/svgs.dart' as svgs;
import '../../global_variables.dart' as global;
import '../../controller.dart';
import '../../piano.dart';
import '../../SketchingTool/sketcher.dart';
import '../../Bluetooth/connection_in_progress.dart';
import '../../PathFinder/path_finder.dart';
import '../../LightDetector/light_detector.dart';

class PlaySelector extends StatefulWidget {
  const PlaySelector({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PlaySelector();
  }
}

class _CardDetails {
  String svg;
  String title;
  Color textBackgroundColor;
  Function? pressed;

  _CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed);
}

class _PlaySelector extends State<PlaySelector> {
  List<_CardDetails> playCards = List<_CardDetails>.empty(growable: true);
  int _focusedIndex = 0;
  double _cardSize = 250;

  void initState() {
    super.initState();
    playCards.add(_CardDetails(
      svgs.drivePlay,
      "drive_play",
      Colors.red,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Controller()),
        );
      },
    ));
    playCards.add(_CardDetails(
      svgs.pathFinderPlay,
      "path_play",
      Colors.green,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PathFinder()),
        );
      },
    ));
    playCards.add(
        _CardDetails(svgs.lightDetectorPlay, "light_play", Colors.orange, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LightDetector()),
      );
    }));
    playCards.add(_CardDetails(svgs.pianoPlay, "piano_play", Colors.purple, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PianoApp()),
      );
    }));
    playCards.add(_CardDetails(
        svgs.drawFollowPlay, "drawFollow_play", const Color(0xffFA857B), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SketcherWidget()),
      );
    }));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
        width: _cardSize,
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: GBloxCards(
                svg: playCards[index].svg,
                text: playCards[index].title,
                textBackgroundColor: playCards[index].textBackgroundColor,
                pressed: playCards[index].pressed)));
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

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
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
            body: Stack(children: [
              SvgPicture.string(
                svgs.pageCityBackground,
                alignment: Alignment.bottomCenter,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: ScrollSnapList(
                            onItemFocus: _onItemFocus,
                            dynamicItemSize: true,
                            itemSize: _cardSize,
                            dynamicItemOpacity: 0.5,
                            duration: 100,
                            focusOnItemTap: true,
                            itemBuilder: _buildListItem,
                            itemCount: playCards.length,
                            reverse: true,
                          ),
                        ),
                      ]))
            ]))));
  }
}

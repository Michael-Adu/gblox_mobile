import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../Modular_Widgets/Cards/cards.dart';
import '../../svgs/svgs.dart' as svgs;
import '../../global_variables.dart' as global;
import '../../blockly.dart';
import '../PlaySelector/play_select.dart';

class ModeSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ModeSelector();
  }
}

class _CardDetails {
  String svg;
  String title;
  Color textBackgroundColor;
  Function? pressed;

  _CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed);
}

class _ModeSelector extends State<ModeSelector> {
  List<_CardDetails> modeCards = List<_CardDetails>.empty(growable: true);
  int _focusedIndex = 0;
  double _cardSize = 250;

  void initState() {
    super.initState();
    modeCards.add(_CardDetails(svgs.codeMode, "code_mode", Colors.orange, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Blockly()),
      );
    }));
    modeCards.add(_CardDetails(svgs.playMode, "play_mode", Colors.purple, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PlaySelector()),
      );
    }));
    modeCards.add(_CardDetails(svgs.buildMode, "build_mode", Colors.orange, () {
      global.displayToast("Build Mode is not ready yet");
    }));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
        width: _cardSize,
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: GBloxCards(
                svg: modeCards[index].svg,
                text: modeCards[index].title,
                textBackgroundColor: modeCards[index].textBackgroundColor,
                pressed: modeCards[index].pressed)));
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
              title: const Text("mode_select_page").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Container(
                child: Stack(children: [
              SvgPicture.string(
                svgs.pageCityBackground,
                alignment: Alignment.bottomCenter,
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: ScrollSnapList(
                        onItemFocus: _onItemFocus,
                        dynamicItemSize: true,
                        itemSize: _cardSize,
                        dynamicItemOpacity: 0.5,
                        duration: 100,
                        focusOnItemTap: true,
                        itemBuilder: _buildListItem,
                        itemCount: modeCards.length,
                        reverse: true,
                        initialIndex: 1,
                      ),
                    ),
                  ]))
            ])))));
  }
}

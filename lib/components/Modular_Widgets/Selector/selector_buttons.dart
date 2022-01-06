import 'package:flutter/material.dart';
import '../Button/buttons.dart';

class SelectorButtons extends StatefulWidget {
  @required
  final List<String>? buttons;
  @required
  final List<Function>? functionList;
  @required
  final String buttonType;
  final int activeColor;
  final int initialIndex;

  const SelectorButtons(
      {Key? key,
      this.buttons,
      this.functionList,
      this.buttonType = "directoryButtons",
      this.activeColor = 0xffDB8000,
      this.initialIndex = 0})
      : super(key: key);

  @override
  _SelectorButtonsState createState() => _SelectorButtonsState();
}

class _SelectButton {
  String title;
  int activeColor;
  Function? pressed;
  _SelectButton(this.title, this.pressed, this.activeColor);
}

class _SelectorButtonsState extends State<SelectorButtons> {
  List<_SelectButton> buttons = List<_SelectButton>.empty(growable: true);
  List<int> buttonColors = List<int>.empty(growable: true);

  void initState() {
    for (var i = 0; i < widget.buttons!.length; i++) {
      if (widget.initialIndex == i) {
        buttonColors.add(widget.activeColor);
      } else {
        buttonColors.add(0x00000000);
      }
      buttons.add(_SelectButton(
          widget.buttons![i], widget.functionList![i], buttonColors[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    buttons.clear();
    for (var i = 0; i < widget.buttons!.length; i++) {
      buttons.add(_SelectButton(
          widget.buttons![i], widget.functionList![i], buttonColors[i]));
    }
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons.map((e) {
        return GBloxButtons(
          buttonType: widget.buttonType,
          buttonName: e.title,
          buttonColor: e.activeColor,
          pressed: () {
            e.pressed!();
            var index = widget.buttons!.indexOf(e.title);
            setState(() {
              buttonColors.fillRange(0, widget.buttons!.length, 0x00000000);
              buttonColors[index] = widget.activeColor;
            });
          },
        );
      }).toList(),
    ));
  }
}

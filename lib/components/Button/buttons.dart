import 'package:flutter/material.dart';
import '../g_blox_custom_s_v_gs_icons.dart';

///Creates a gBlox button widget
///
class GBloxButtons extends StatefulWidget {
  @required
  late final String buttonType;
  @required
  late final Icon icon;
  @required
  late final Function? pressed;
  late final int buttonColor;
  GBloxButtons(
      {Key? key,
      this.buttonType = "controller_square",
      this.icon = const Icon(GBloxCustomSVGs.rotateMovement),
      this.pressed,
      this.buttonColor = 0xffDB8000});
  @override
  State<StatefulWidget> createState() {
    return _GBloxButtons();
  }
}

class _GBloxButtons extends State<GBloxButtons> {
  late Widget button = Container();
  List<Color> gradient = [const Color(0xffDB8000), const Color(0xffFFC178)];
  Color containerColor = const Color(0xffE2D424);
  late List<Color> _toggledColor;
  late List<Color> _untoggledColor;
  late List<Color> _activeColor;
  _GBloxButtons();

  @override
  void initState() {
    super.initState();
    try {
      gradient = [
        Color(widget.buttonColor).withOpacity(1.0),
        Color(widget.buttonColor).withOpacity(0.8)
      ];
      _toggledColor = [gradient[0].withAlpha(50), gradient[1].withAlpha(50)];
      _untoggledColor = [
        gradient[1].withAlpha(255),
        gradient[0].withAlpha(255)
      ];
      containerColor = Color(widget.buttonColor).withOpacity(0);
      _activeColor = _untoggledColor;
    } catch (e) {}

    switch (widget.buttonType) {
      case "controller_square":
        button = InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: AnimatedContainer(
              width: 100,
              height: 50,
              duration: const Duration(seconds: 1),
              padding: const EdgeInsets.all(7.535),
              child: Container(
                child: widget.icon,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border:
                        Border.all(width: 2, color: const Color(0xffE6DA2F)),
                    boxShadow: [
                      BoxShadow(
                          color: containerColor, blurRadius: 2, spreadRadius: 0)
                    ]),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x506E6EAC), blurRadius: 1, spreadRadius: 0)
                ],
              ),
            ),
            onTap: () {
              widget.pressed!();
              setState(() {
                containerColor = Color(widget.buttonColor).withOpacity(1);
              });
            });
        break;
      case "controller_circle":
        button = InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          child: AnimatedContainer(
              child: AnimatedContainer(
                  height: 60,
                  width: 60,
                  duration: const Duration(seconds: 1),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: _activeColor)),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: widget.icon,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: _toggledColor)),
                  )),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x506E6EAC), blurRadius: 1, spreadRadius: 0)
                ],
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              duration: const Duration(seconds: 1)),
          radius: 0,
          onTap: () {
            widget.pressed!();
            setState(() {
              print("Setting to untoggled State");
            });
          },
          onTapDown: (TapDownDetails) async {
            print(TapDownDetails.kind);
            _activeColor = _toggledColor;
          },
          onHighlightChanged: (param) {
            setState(() {
              print("Setting to toggled State");
              _activeColor = _toggledColor;
            });
          },
        );
        break;
      default:
        button = InkWell(
          child: Container(
            child: Container(
              child: widget.icon,
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (button);
  }
}

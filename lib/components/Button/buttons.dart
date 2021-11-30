import 'package:flutter/material.dart';
import '../g_blox_custom_s_v_gs_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      this.icon = const Icon(GBloxCustomSVGs.group_21),
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
  bool toggled = false;
  late List<Color> toggledColor;
  late List<Color> untoggledColor;
  _GBloxButtons();

  @override
  void initState() {
    super.initState();
    try {
      gradient = [
        Color(widget.buttonColor).withOpacity(1.0),
        Color(widget.buttonColor).withOpacity(0.8)
      ];
      toggledColor = [
        Color.alphaBlend(gradient[0], const Color(0xff000000)),
        Color.alphaBlend(gradient[1], const Color(0xff000000))
      ];
      untoggledColor = [
        Color.alphaBlend(gradient[0], const Color(0xffffffff)),
        Color.alphaBlend(gradient[1], const Color(0xffffffff))
      ];
      containerColor = Color(widget.buttonColor).withOpacity(0);
    } catch (e) {}

    switch (widget.buttonType) {
      case "controller_square":
        button = InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              width: 100,
              height: 50,
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
          child: Container(
            child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: toggled ? untoggledColor : toggledColor)),
                child: Container(
                  height: 60,
                  width: 60,
                  child: widget.icon,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: toggledColor)),
                )),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0x506E6EAC), blurRadius: 1, spreadRadius: 0)
              ],
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
          ),
          onTap: () {
            widget.pressed!();
            setState(() {
              print(toggled);
              toggled = false;
            });
          },
          onTapDown: (TapDownDetails) {
            print(toggled);
            setState(() {
              toggled = true;
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

import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../global_variables.dart' as global;
import '../../svgs/g_blox_custom_s_v_gs_icons.dart';

///Creates a gBlox button widget
///
class GBloxButtons extends StatefulWidget {
  @required
  late final String buttonType;
  @required
  late final IconData icon;
  @required
  late final Function? pressed;
  late final Function? onLongPress;
  late final bool rotate;
  late final int buttonColor;
  late final String buttonName;
  GBloxButtons(
      {Key? key,
      this.buttonType = "controller_square",
      this.icon = GBloxCustomSVGs.rotateMovement,
      this.pressed,
      this.buttonColor = 0xffDB8000,
      this.buttonName = "New",
      this.rotate = false,
      this.onLongPress});
  @override
  State<StatefulWidget> createState() {
    return _GBloxButtons();
  }
}

class _GBloxButtons extends State<GBloxButtons> {
  late Widget button = Container();
  List<Color> gradient = [const Color(0xffDB8000), const Color(0xffFFC178)];
  late Color _toggledContainerColor;
  late Color _untoggledContainerColor;
  late List<Color> _toggledColor;
  late List<Color> _untoggledColor;
  bool _toggledState = false;
  _GBloxButtons();

  @override
  void initState() {
    super.initState();

    try {
      gradient = [
        Color(widget.buttonColor).withOpacity(1.0),
        Color(widget.buttonColor).withOpacity(0.8)
      ];
      _toggledColor = [
        HSLColor.fromColor(gradient[0]).withLightness(0.3).toColor(),
        HSLColor.fromColor(gradient[1]).withLightness(0.3).toColor()
      ];
      _untoggledColor = [gradient[1], gradient[0]];
      _toggledContainerColor = Color(widget.buttonColor);
      _untoggledContainerColor = Color(0xffE2D424);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    gradient = [
      Color(widget.buttonColor).withOpacity(1.0),
      Color(widget.buttonColor).withOpacity(0.8)
    ];
    _toggledColor = [
      HSLColor.fromColor(gradient[0]).withLightness(0.3).toColor(),
      HSLColor.fromColor(gradient[1]).withLightness(0.3).toColor()
    ];
    _untoggledColor = [gradient[1], gradient[0]];
    switch (widget.buttonType) {
      case "controller_square":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: AnimatedContainer(
                // width: global.device_width * 0.102,
                // height: global.device_height * 0.08,
                duration: const Duration(seconds: 1),
                padding: const EdgeInsets.all(5),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 10),
                  child: widget.rotate
                      ? Transform.rotate(
                          angle: math.pi / 2,
                          child: Icon(widget.icon,
                              color: _toggledState
                                  ? _toggledContainerColor
                                  : _untoggledContainerColor,
                              size: global.device_width * 0.08))
                      : Icon(widget.icon,
                          color: _toggledState
                              ? _toggledContainerColor
                              : _untoggledContainerColor,
                          size: global.device_width * 0.025),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border:
                          Border.all(width: 2, color: const Color(0xffE6DA2F)),
                      boxShadow: [
                        BoxShadow(
                            color: _toggledState
                                ? _untoggledContainerColor
                                : _toggledContainerColor,
                            blurRadius: 2,
                            spreadRadius: 0)
                      ]),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x506E6EAC),
                        blurRadius: 1,
                        spreadRadius: 2)
                  ],
                ),
              ),
              onTap: () {
                widget.pressed!();
                setState(() {
                  _toggledState = false;
                });
              },
              onTapDown: (TapDownDetails) {
                setState(() {
                  _toggledState = true;
                });
              },
              onTapCancel: () {
                setState(() {
                  _toggledState = false;
                });
              },
            )));
      case "controller_circle":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              child: Container(
                child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: gradient)),
                    child: AnimatedContainer(
                      child: widget.rotate
                          ? Transform.rotate(
                              angle: math.pi / 4,
                              child: Icon(widget.icon, color: Colors.white))
                          : Icon(widget.icon,
                              color: Colors.white,
                              size: global.device_height * 0.08),
                      duration: const Duration(milliseconds: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: _toggledState
                                  ? _toggledColor
                                  : _untoggledColor)),
                    )),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x506E6EAC),
                        blurRadius: 1,
                        spreadRadius: 0)
                  ],
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5),
              ),
              radius: 0,
              onTap: () {
                widget.pressed!();
                setState(() {
                  _toggledState = false;
                });
              },
              onTapDown: (TapDownDetails) async {
                setState(() {
                  _toggledState = true;
                });
              },
              onTapCancel: () {
                setState(() {
                  _toggledState = false;
                });
              },
            )));
      case "menuButtons":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 35,
            color: _toggledState ? Colors.blue : Colors.transparent,
            child: InkWell(
                onTap: () {
                  widget.pressed!();
                  setState(() {
                    _toggledState = false;
                  });
                },
                onTapDown: (TapDownDetails) {
                  setState(() {
                    _toggledState = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _toggledState = false;
                  });
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Text(widget.buttonName,
                        style: const TextStyle(color: Colors.white))))));
      case "fileButtons":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 35,
            color: _toggledState ? Colors.blue : Colors.transparent,
            child: InkWell(
                onTap: () {
                  widget.pressed!();
                  setState(() {
                    _toggledState = false;
                  });
                },
                onTapDown: (TapDownDetails) {
                  setState(() {
                    _toggledState = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _toggledState = false;
                  });
                },
                onLongPress: () {
                  widget.onLongPress!();
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.buttonName,
                              style: const TextStyle(color: Colors.white)),
                          Container(
                              width: global.device_width * 0.05,
                              height: global.device_width * 0.05,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt())
                                    .withOpacity(1.0),
                              ))
                        ])))));
      case "directoryButtons":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 35,
            color: _toggledState ? Colors.blue : Colors.transparent,
            child: InkWell(
                onTap: () {
                  widget.pressed!();
                  setState(() {
                    _toggledState = false;
                  });
                },
                onTapDown: (TapDownDetails) {
                  setState(() {
                    _toggledState = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _toggledState = false;
                  });
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(widget.buttonColor),
                    ),
                    child: Text(widget.buttonName,
                        style: const TextStyle(color: Colors.white))))));
      case "projectButtons":
        return (AnimatedContainer(
            duration: const Duration(milliseconds: 1),
            padding: const EdgeInsets.all(5),
            width: 100,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: _toggledContainerColor, width: 2),
              color: _toggledState
                  ? Color(widget.buttonColor)
                  : Colors.transparent,
            ),
            child: InkWell(
                onTap: () {
                  widget.pressed!();
                  setState(() {
                    _toggledState = false;
                  });
                },
                onTapDown: (TapDownDetails) {
                  setState(() {
                    _toggledState = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _toggledState = false;
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    child: Text(widget.buttonName,
                        style: const TextStyle(color: Colors.white))))));

      default:
        return (InkWell(
          child: Container(
            child: Container(
              child: Icon(widget.icon),
            ),
          ),
        ));
    }
  }
}

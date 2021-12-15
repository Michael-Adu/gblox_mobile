import 'package:flutter/material.dart';
import '../../global_variables.dart' as global;
import '../../svgs/g_blox_custom_s_v_gs_icons.dart';
import 'toolbox_buttons.dart';
import 'dart:math' as math;

class _ToolboxClass {
  String name;
  bool category;
  int index;
  _ToolboxClass(this.name, this.category, this.index);
}

class ToolboxCategoryButtons extends StatefulWidget {
  @required
  late String name;
  @required
  late Color color;
  @required
  Function? pressed;
  @required
  late bool category;
  @required
  late var categoryChildren;
  late Icon? toolboxIcon = const Icon(Icons.lightbulb_outline);

  ToolboxCategoryButtons(
      {Key? key,
      this.name = "Empty Item",
      this.color = Colors.red,
      this.category = false,
      this.pressed,
      this.categoryChildren,
      this.toolboxIcon})
      : super(key: key);
  @override
  _ToolboxCategoryButtonsState createState() => _ToolboxCategoryButtonsState();
}

class _ToolboxCategoryButtonsState extends State<ToolboxCategoryButtons> {
  late Icon toolboxIcon = const Icon(Icons.lightbulb_outline);
  bool pressed = false;

  void initState() {
    super.initState();

    switch (widget.name) {
      case "Loops":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxloops,
            color: Colors.white, size: 10);
        break;
      case "Logic":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxlogic_1,
            color: Colors.white, size: 10);
        break;
      case "Math":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxmath,
            color: Colors.white, size: 10);
        break;
      case "Text":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxtext,
            color: Colors.white, size: 10);
        break;
      case "Actuators":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxactuators,
            color: Colors.white, size: 10);
        break;
      case "Sensors":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxsensors,
            color: Colors.white, size: 10);
        break;
      case "COM":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxcom_1,
            color: Colors.white, size: 10);
        break;
      default:
        toolboxIcon = const Icon(
          GBloxCustomSVGs.toolboxsound,
          color: Colors.white,
          size: 10,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.category
        ? ExpansionTile(
            title: Row(children: [
              Container(width: 5, height: 35, color: widget.color),
              const SizedBox(width: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  width: 20,
                  child: toolboxIcon),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Text(widget.name,
                        style: const TextStyle(color: Colors.white)),
                    widget.category
                        ? Icon(Icons.arrow_downward,
                            color: Colors.white, size: 10)
                        : Container()
                  ]))
            ]),
            children: widget.categoryChildren.map((e) => InkWell(
                onTap: () {
                  e.pressed!();
                  setState(() {
                    pressed = false;
                  });
                },
                onTapDown: (TapDownDetails) {
                  setState(() {
                    pressed = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    pressed = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  color: pressed ? widget.color : Colors.transparent,
                  child: Row(
                    children: [
                      Container(width: 5, height: 35, color: widget.color),
                      const SizedBox(width: 10),
                      Container(
                          alignment: Alignment.centerLeft,
                          width: 20,
                          child: toolboxIcon),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Row(children: [
                            Text(e.name,
                                style: const TextStyle(color: Colors.white)),
                            widget.category
                                ? Icon(Icons.arrow_downward,
                                    color: Colors.white, size: 10)
                                : Container()
                          ]))
                    ],
                  ),
                ))))
        : InkWell(
            onTap: () {
              widget.pressed!();
              setState(() {
                pressed = false;
              });
            },
            onTapDown: (TapDownDetails) {
              setState(() {
                pressed = true;
              });
            },
            onTapCancel: () {
              setState(() {
                pressed = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 10),
              color: pressed ? widget.color : Colors.transparent,
              child: Row(
                children: [
                  Container(width: 5, height: 35, color: widget.color),
                  const SizedBox(width: 10),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 20,
                      child: toolboxIcon),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Text(widget.name,
                            style: const TextStyle(color: Colors.white)),
                        widget.category
                            ? Icon(Icons.arrow_downward,
                                color: Colors.white, size: 10)
                            : Container()
                      ]))
                ],
              ),
            ));
  }
}

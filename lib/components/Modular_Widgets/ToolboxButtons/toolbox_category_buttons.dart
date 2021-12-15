import 'package:flutter/material.dart';
import '../../global_variables.dart' as global;
import '../../svgs/g_blox_custom_s_v_gs_icons.dart';
import 'toolbox_buttons.dart';
import 'dart:math' as math;

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
  late List<global.ToolboxClass>? categoryChildren;
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
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: EdgeInsets.all(0),
            tilePadding: EdgeInsets.all(0),
            textColor: Colors.white,
            onExpansionChanged: (changed) {
              print(widget.categoryChildren);
            },
            title: Row(children: [
              Container(width: 5, height: 35, color: widget.color),
              const SizedBox(width: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  width: 20,
                  child: toolboxIcon),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.name,
                      style: const TextStyle(color: Colors.white)))
            ]),
            children: widget.categoryChildren!
                .map((e) => ListTile(
                    onTap: () {
                      global.webController!.evaluateJavascript(source: '''
                  clickOnToolbox(${e.index});
                  ''');
                      setState(() {
                        pressed = false;
                      });
                    },
                    title: AnimatedContainer(
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
                            child: Text(e.name,
                                style: const TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    )))
                .toList())
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
                      child: Text(widget.name,
                          style: const TextStyle(color: Colors.white)))
                ],
              ),
            ));
  }
}

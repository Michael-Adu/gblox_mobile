import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'dart:math' as math;
import '../../global_variables.dart' as global;
import '../../svgs/g_blox_custom_s_v_gs_icons.dart';

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
  bool opened = false;

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
      case "LEDs":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxled,
            color: Colors.white, size: 10);
        break;
      case "Sound":
        toolboxIcon = const Icon(GBloxCustomSVGs.toolboxsound,
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
        ? Container(
            child: ConfigurableExpansionTile(
                animatedWidgetFollowingHeader: Container(
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.arrow_downward,
                        color: Colors.white, size: 10)),
                onExpansionChanged: (state) {
                  setState(() {
                    opened = state;
                  });
                },
                borderColorEnd: widget.color,
                animatedWidgetPrecedingHeader:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      width: global.device_size.width * 0.006,
                      height: global.device_size.height * 0.09,
                      color: widget.color),
                  SizedBox(width: global.device_size.width * 0.013),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: global.device_size.width * 0.024,
                      child: toolboxIcon),
                ]),
                header: Container(
                    width: global.device_size.width * 0.1475,
                    alignment: Alignment.centerLeft,
                    child: Text(widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: global.device_size.width * 0.018))),
                headerExpanded: Container(
                    width: global.device_size.width * 0.1475,
                    alignment: Alignment.center,
                    child: Text(widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: global.device_size.width * 0.018))),
                children: widget.categoryChildren!
                    .map((e) => InkWell(
                        onTap: () {
                          global.webController!.evaluateJavascript(source: '''
                  document.getElementById("${e.click}").click();
                  ''');
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
                              Container(
                                  width: global.device_size.width * 0.006,
                                  height: global.device_size.height * 0.09,
                                  color: widget.color),
                              SizedBox(width: global.device_size.width * 0.013),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  width: global.device_size.width * 0.024,
                                  child: toolboxIcon),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(e.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            global.device_size.width * 0.018)),
                              )
                            ],
                          ),
                        )))
                    .toList()))
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
                  Container(
                      width: global.device_size.width * 0.006,
                      height: global.device_size.height * 0.09,
                      color: widget.color),
                  SizedBox(width: global.device_size.width * 0.013),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: global.device_size.width * 0.024,
                      child: toolboxIcon),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: global.device_size.width * 0.018)))
                ],
              ),
            ));
  }
}

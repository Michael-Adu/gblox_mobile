import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class SketchShapes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SketchShapesStates();
  }
}

class _SketchShapesStates extends State<SketchShapes> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff060841),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("shapes_page").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: GridView.count(crossAxisCount: 3, children: [
              Container(),
            ]))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../svgs/svgs.dart' as svgs;

class SketchShapes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SketchShapesStates();
  }
}

class _SketchShapesStates extends State<SketchShapes> {
  @override
  List<String> shapes_svg = [
    svgs.triangle,
    svgs.circle,
    svgs.square,
    svgs.hexagon,
    svgs.pentagon,
    svgs.heart
  ];
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff060841),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
                title: const Text("shapes_page").tr(),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
            body: Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2.5),
                    itemCount: shapes_svg.length,
                    padding: EdgeInsets.all(20),
                    itemBuilder: (BuildContext context, int index) {
                      return (InkWell(
                          child: Container(
                              width: 500,
                              constraints: BoxConstraints.tight(Size(500, 500)),
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.string(shapes_svg[index]),
                              decoration: BoxDecoration(
                                  color: const Color(0xff060841),
                                  border: Border.all(
                                      color: const Color(0xff0000DC),
                                      width: 3)))));
                    })))));
  }
}

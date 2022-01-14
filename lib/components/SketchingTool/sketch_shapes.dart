import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../global_variables.dart' as global;
import '../svgs/svgs.dart' as svgs;
import 'shape_paths.dart' as shapes;

class SketchShapes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SketchShapesStates();
  }
}

class _SketchShapesStates extends State<SketchShapes> {
  @override
  List<global.ShapeData> shapes_svg =
      List<global.ShapeData>.empty(growable: true);

  void initState() {
    super.initState();
    shapes_svg.add(global.ShapeData(
        "triangle", svgs.triangle, shapes.Triangle().returnPath()));
    shapes_svg.add(
        global.ShapeData("circle", svgs.circle, shapes.Circle().returnPath()));
    shapes_svg.add(
        global.ShapeData("square", svgs.square, shapes.Square().returnPath()));
    shapes_svg.add(global.ShapeData(
        "hexagon", svgs.hexagon, shapes.Hexagon().returnPath()));
    shapes_svg.add(global.ShapeData(
        "pentagon", svgs.pentagon, shapes.Pentagon().returnPath()));
    shapes_svg.add(
        global.ShapeData("heart", svgs.heart, shapes.Heart().returnPath()));
  }

  Widget build(BuildContext context) {
    var thedata;
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
                    itemBuilder: (BuildContext builderContext, int index) {
                      return (InkWell(
                          onTap: () {
                            thedata = {
                              "data": shapes_svg[index],
                              "message": "data is returned"
                            };
                            Navigator.pop(context, thedata);
                          },
                          child: Container(
                              width: 500,
                              constraints: BoxConstraints.tight(Size(500, 500)),
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.string(shapes_svg[index].svg),
                              decoration: BoxDecoration(
                                  color: const Color(0xff060841),
                                  border: Border.all(
                                      color: const Color(0xff0000DC),
                                      width: 3)))));
                    })))));
  }
}

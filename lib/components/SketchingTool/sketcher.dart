import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import 'sketch_shapes.dart';
import '../global_variables.dart' as global;
import 'shape_paths.dart' as shapes;

class SketcherWidget extends StatefulWidget {
  const SketcherWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SketcherState();
  }
}

class _SketcherState extends State<SketcherWidget> {
  List<Offset> points = <Offset>[];
  Path shapePath = Path();
  var sketchWidget;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('draw_and_follow_drawer').tr(),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(
                  onPressed: () async {
                    var shapeData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SketchShapes()))
                        .then((shapeData) {
                      setState(() {
                        points.clear();
                        shapePath = shapeData['data'].path;
                        sketchWidget = Sketcher(points, shapePath);
                      });
                      global.displayToast(points.length.toString());
                    });
                  },
                  icon: const Icon(Icons.arrow_upward))
            ],
          ),
          body:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: global.device_size.width * 0.7,
              child: ClipRect(
                  child: GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onPanStart: (details) {
                  points.clear();
                },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    RenderBox box = context.findRenderObject() as RenderBox;
                    Offset point = box.globalToLocal(details.globalPosition);
                    point =
                        point.translate(0.0, -(AppBar().preferredSize.height));
                    points = List.from(points)..add(point);
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  points.add(Offset.zero);
                  print(points);
                },
                child: Container(
                    margin: const EdgeInsets.all(0.0),
                    width: global.device_size.width * 0.7,
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                        color: Color(0xff060841),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: CustomPaint(
                      painter: Sketcher(points, shapePath),
                      child: Container(),
                    )),
              )),
            ),
            Container(
              width: global.device_size.width * 0.2,
              height: global.device_size.height * 0.2,
              child: GBloxButtons(
                  buttonType: "controller_circle",
                  icon: Icons.play_arrow,
                  pressed: () {},
                  buttonColor: 0xff3EA52C),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            tooltip: 'clear Screen',
            backgroundColor: Colors.red,
            child: const Icon(Icons.refresh),
            onPressed: () {
              setState(() => points.clear());
            },
          ),
        ));
  }
}

class Sketcher extends CustomPainter {
  final List<Offset> points;
  final Path path;
  Sketcher(this.points, this.path);

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return oldDelegate.points != points;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) {
      Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
      paint_1_fill.color = Color(0xffffffff).withOpacity(1.0);
      canvas.drawPath(path, paint_1_fill);
    } else {
      Paint paint = Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.butt
        ..strokeWidth = 4.0;

      for (int i = 0; i < points.length - 1; i++) {
        if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
          canvas.drawLine(points[i], points[i + 1], paint);
        }
      }
    }
  }
}

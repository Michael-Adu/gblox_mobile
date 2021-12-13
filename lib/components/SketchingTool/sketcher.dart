import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../svgs/g_blox_custom_s_v_gs_icons.dart';
import 'sketch_shapes.dart';
import '../global_variables.dart' as global;

class SketcherWidget extends StatefulWidget {
  const SketcherWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SketcherState();
  }
}

class _SketcherState extends State<SketcherWidget> {
  List<Offset> points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    final Container sketchArea = Container(
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
          color: Color(0xff060841),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: CustomPaint(
        painter: Sketcher(points),
        child: Container(),
      ),
    );

    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('draw_and_follow_drawer').tr(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SketchShapes()));
                  },
                  icon: const Icon(Icons.arrow_upward))
            ],
          ),
          body: Stack(clipBehavior: Clip.none, children: [
            Container(
                width: 600,
                child: ClipRect(
                    child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanStart: (details) {
                    points.clear();
                  },
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      RenderBox box = context.findRenderObject() as RenderBox;
                      Offset point = box.globalToLocal(details.globalPosition);
                      point = point.translate(
                          0.0, -(AppBar().preferredSize.height));
                      points = List.from(points)..add(point);
                    });
                  },
                  onPanEnd: (DragEndDetails details) {
                    points.add(Offset.zero);
                    print(points);
                  },
                  child: sketchArea,
                ))),
            Positioned(
              top: 100,
              left: 660,
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

  Sketcher(this.points);

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return oldDelegate.points != points;
  }

  @override
  void paint(Canvas canvas, Size size) {
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

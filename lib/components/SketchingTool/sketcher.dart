import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Button/buttons.dart';
import '../g_blox_custom_s_v_gs_icons.dart';

class SketcherWidget extends StatefulWidget {
  SketcherWidget({Key? key}) : super(key: key);
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
      margin: const EdgeInsets.all(1.0),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: CustomPaint(
        painter: Sketcher(points),
      ),
    );

    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('draw_and_follow_drawer').tr(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // leading: Builder(builder: (context) {
            //   return IconButton(
            //       icon: const Icon(Icons.arrow_back, color: Colors.white),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const GbloxApp()));
            //       });
            // },
            // ),
          ),
          body: Stack(clipBehavior: Clip.none, children: [
            Container(
                width: 600,
                child: ClipRect(
                    child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
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
                  icon: const Icon(GBloxCustomSVGs.gBloxLogo,
                      color: Color(0xffffffff), size: 30),
                  pressed: () {},
                  buttonColor: 0xff1D184B),
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

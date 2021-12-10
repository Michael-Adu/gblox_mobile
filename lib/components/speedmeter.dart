import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'svgs/g_blox_custom_s_v_gs_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Speedometer extends StatefulWidget {
  @required
  late final ValueNotifier<double>? speed;
  Speedometer({Key? key, this.speed});
  @override
  State<StatefulWidget> createState() {
    return _SpeedometerState();
  }
}

class _SpeedometerState extends State<Speedometer> {
  late Widget meter;
  late List<int> enabledBars = [];
  _SpeedometerState();
  void initState() {
    super.initState();
    displayToast(widget.speed!.value.toInt().toString());
  }

  void updateValue() {
    enabledBars.clear();
    for (int i = 0; i < widget.speed!.value; i++) {
      enabledBars.add(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        height: 100,
        width: 200,
        child: Stack(children: [
          ValueListenableBuilder(
              valueListenable: widget.speed!,
              builder: (context, value, widget) {
                updateValue();
                return Container(
                    margin: const EdgeInsets.fromLTRB(14, 28, 0, 0),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: enabledBars
                            .map((bar) => Container(
                                width: 11.5,
                                height: bar * 65,
                                child: SvgPicture.string(
                                  '''<svg xmlns="http://www.w3.org/2000/svg" width="21.255" height="208.821" viewBox="0 0 21.255 208.821">
  <path id="Path_120" data-name="Path 120" d="M1551.224,145.084V352.457h-20.255V158.615Q1541.17,151.973,1551.224,145.084Z" transform="translate(-1530.469 -144.136)" fill="#4a4f68" stroke="rgba(0,0,0,0)" stroke-miterlimit="10" stroke-width="1"/>
</svg>
''',
                                  width: 480,
                                  // fit: BoxFit.scaleDown,
                                  color: Colors.green,
                                )))
                            .toList()));
              }),
          CustomPaint(
            painter: BackgroundPainter(),
            child: Container(width: 200),
          ),
          Container(
              child: CustomPaint(
            painter: ForwardPainter(),
            child: Container(width: 400),
          ))
        ])));
  }

  void displayToast(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9976480, size.height * 0.9955811);
    path_0.lineTo(0, size.height * 0.9955811);
    path_0.lineTo(0, size.height * 0.7837118);
    path_0.lineTo(size.width * 0.0007641463, size.height * 0.7837869);
    path_0.lineTo(size.width * 0.0007641463, size.height * 0.9945000);
    path_0.lineTo(size.width * 0.9972109, size.height * 0.9945000);
    path_0.lineTo(size.width * 0.9972109, size.height * 0.001633005);
    path_0.lineTo(size.width * 0.9971329, size.height * 0.001633005);
    path_0.lineTo(size.width * 0.9973912, size.height * 0.001172498);
    path_0.lineTo(size.width * 0.9976495, size.height * 0.0007119902);
    path_0.lineTo(size.width * 0.9976495, size.height * 0.9955811);
    path_0.close();
    path_0.moveTo(size.width * 0.02195239, size.height * 0.7845479);
    path_0.cubicTo(
        size.width * 0.01044129,
        size.height * 0.7845479,
        size.width * 0.003307225,
        size.height * 0.7840122,
        size.width * 0.0007641463,
        size.height * 0.7837836);
    path_0.lineTo(size.width * 0.0007641463, size.height * 0.001633005);
    path_0.lineTo(size.width * 0.9971329, size.height * 0.001633005);
    path_0.cubicTo(
        size.width * 0.9719161,
        size.height * 0.04674313,
        size.width * 0.9457181,
        size.height * 0.09064158,
        size.width * 0.9192893,
        size.height * 0.1321101);
    path_0.cubicTo(
        size.width * 0.8938540,
        size.height * 0.1720175,
        size.width * 0.8675047,
        size.height * 0.2107654,
        size.width * 0.8409735,
        size.height * 0.2472761);
    path_0.cubicTo(
        size.width * 0.8155106,
        size.height * 0.2823139,
        size.width * 0.7891980,
        size.height * 0.3162282,
        size.width * 0.7627708,
        size.height * 0.3480783);
    path_0.cubicTo(
        size.width * 0.7374745,
        size.height * 0.3785632,
        size.width * 0.7113972,
        size.height * 0.4079671,
        size.width * 0.6852619,
        size.height * 0.4354734);
    path_0.cubicTo(
        size.width * 0.6603263,
        size.height * 0.4617191,
        size.width * 0.6346754,
        size.height * 0.4869294,
        size.width * 0.6090337,
        size.height * 0.5104120);
    path_0.cubicTo(
        size.width * 0.5846529,
        size.height * 0.5327320,
        size.width * 0.5596332,
        size.height * 0.5540753,
        size.width * 0.5346686,
        size.height * 0.5738412);
    path_0.cubicTo(
        size.width * 0.4887266,
        size.height * 0.6102180,
        size.width * 0.4413541,
        size.height * 0.6425679,
        size.width * 0.3938639,
        size.height * 0.6699860);
    path_0.cubicTo(
        size.width * 0.2147801,
        size.height * 0.7733912,
        size.width * 0.07412219,
        size.height * 0.7845446,
        size.width * 0.02195698,
        size.height * 0.7845446);
    path_0.lineTo(size.width * 0.02195698, size.height * 0.7845446);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001528293;
    paint_0_stroke.color = Color(0xff0B0533).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff0B0533).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ForwardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9701542, size.height * 0.9262885);
    path_0.lineTo(size.width * 0.02953890, size.height * 0.9262885);
    path_0.lineTo(size.width * 0.02953890, size.height * 0.7445714);
    path_0.cubicTo(
        size.width * 0.02959078,
        size.height * 0.7445714,
        size.width * 0.03700432,
        size.height * 0.7452885,
        size.width * 0.05023919,
        size.height * 0.7452885);
    path_0.cubicTo(
        size.width * 0.09945101,
        size.height * 0.7452885,
        size.width * 0.2321484,
        size.height * 0.7357059,
        size.width * 0.4010720,
        size.height * 0.6469412);
    path_0.cubicTo(
        size.width * 0.6132983,
        size.height * 0.5354202,
        size.width * 0.8047651,
        size.height * 0.3423277,
        size.width * 0.9701542,
        size.height * 0.07302521);
    path_0.lineTo(size.width * 0.9701542, size.height * 0.9262857);
    path_0.lineTo(size.width * 0.9701542, size.height * 0.9262885);
    path_0.close();
    path_0.moveTo(size.width * 0.9267824, size.height * 0.2622745);
    path_0.cubicTo(
        size.width * 0.9169107,
        size.height * 0.2754034,
        size.width * 0.9070922,
        size.height * 0.2881541,
        size.width * 0.8975980,
        size.height * 0.3001737);
    path_0.lineTo(size.width * 0.8975980, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.9267824, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.9267824, size.height * 0.2622745);
    path_0.close();
    path_0.moveTo(size.width * 0.8683977, size.height * 0.3363305);
    path_0.cubicTo(
        size.width * 0.8589323,
        size.height * 0.3477815,
        size.width * 0.8491124,
        size.height * 0.3593613,
        size.width * 0.8392118,
        size.height * 0.3707479);
    path_0.lineTo(size.width * 0.8392118, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.8683977, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.8683977, size.height * 0.3363305);
    path_0.close();
    path_0.moveTo(size.width * 0.8100130, size.height * 0.4035574);
    path_0.cubicTo(
        size.width * 0.8004280,
        size.height * 0.4140980,
        size.width * 0.7906037,
        size.height * 0.4246190,
        size.width * 0.7808141,
        size.height * 0.4348319);
    path_0.lineTo(size.width * 0.7808141, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.8100130, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.8100130, size.height * 0.4035574);
    path_0.close();
    path_0.moveTo(size.width * 0.7516282, size.height * 0.4645658);
    path_0.cubicTo(
        size.width * 0.7424150,
        size.height * 0.4737255,
        size.width * 0.7325908,
        size.height * 0.4832409,
        size.width * 0.7224294,
        size.height * 0.4928571);
    path_0.lineTo(size.width * 0.7224294, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.7516282, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.7516282, size.height * 0.4645658);
    path_0.close();
    path_0.moveTo(size.width * 0.6932277, size.height * 0.5197031);
    path_0.cubicTo(
        size.width * 0.6834294,
        size.height * 0.5284650,
        size.width * 0.6736081,
        size.height * 0.5370168,
        size.width * 0.6640432,
        size.height * 0.5451176);
    path_0.lineTo(size.width * 0.6640432, size.height * 0.8431569);
    path_0.lineTo(size.width * 0.6932277, size.height * 0.8431569);
    path_0.lineTo(size.width * 0.6932277, size.height * 0.5197031);
    path_0.close();
    path_0.moveTo(size.width * 0.6348444, size.height * 0.5692353);
    path_0.cubicTo(
        size.width * 0.6249957,
        size.height * 0.5771485,
        size.width * 0.6151715,
        size.height * 0.5848151,
        size.width * 0.6056441,
        size.height * 0.5920224);
    path_0.lineTo(size.width * 0.6056441, size.height * 0.8431513);
    path_0.lineTo(size.width * 0.6348444, size.height * 0.8431513);
    path_0.lineTo(size.width * 0.6348444, size.height * 0.5692353);
    path_0.close();
    path_0.moveTo(size.width * 0.5764597, size.height * 0.6134930);
    path_0.cubicTo(
        size.width * 0.5670461,
        size.height * 0.6202549,
        size.width * 0.5572219,
        size.height * 0.6270756,
        size.width * 0.5472608,
        size.height * 0.6337703);
    path_0.lineTo(size.width * 0.5472608, size.height * 0.8431597);
    path_0.lineTo(size.width * 0.5764597, size.height * 0.8431597);
    path_0.lineTo(size.width * 0.5764597, size.height * 0.6134930);
    path_0.close();
    path_0.moveTo(size.width * 0.5180749, size.height * 0.6527703);
    path_0.cubicTo(
        size.width * 0.5083141,
        size.height * 0.6589328,
        size.width * 0.4984899,
        size.height * 0.6649104,
        size.width * 0.4888761,
        size.height * 0.6705630);
    path_0.lineTo(size.width * 0.4888761, size.height * 0.8431597);
    path_0.lineTo(size.width * 0.5180749, size.height * 0.8431597);
    path_0.lineTo(size.width * 0.5180749, size.height * 0.6527703);
    path_0.close();
    path_0.moveTo(size.width * 0.4596758, size.height * 0.6871933);
    path_0.cubicTo(
        size.width * 0.4501225,
        size.height * 0.6924482,
        size.width * 0.4403026,
        size.height * 0.6976415,
        size.width * 0.4304914,
        size.height * 0.7026359);
    path_0.lineTo(size.width * 0.4304914, size.height * 0.8431625);
    path_0.lineTo(size.width * 0.4596758, size.height * 0.8431625);
    path_0.lineTo(size.width * 0.4596758, size.height * 0.6871961);
    path_0.lineTo(size.width * 0.4596758, size.height * 0.6871933);
    path_0.close();
    path_0.moveTo(size.width * 0.4012968, size.height * 0.7169384);
    path_0.cubicTo(
        size.width * 0.3916614,
        size.height * 0.7214706,
        size.width * 0.3818444,
        size.height * 0.7259020,
        size.width * 0.3721110,
        size.height * 0.7301036);
    path_0.lineTo(size.width * 0.3721110, size.height * 0.8431429);
    path_0.lineTo(size.width * 0.4012968, size.height * 0.8431429);
    path_0.lineTo(size.width * 0.4012968, size.height * 0.7169384);
    path_0.close();
    path_0.moveTo(size.width * 0.3429135, size.height * 0.7421485);
    path_0.cubicTo(
        size.width * 0.3325259,
        size.height * 0.7462325,
        size.width * 0.3229741,
        size.height * 0.7498095,
        size.width * 0.3137147,
        size.height * 0.7530728);
    path_0.lineTo(size.width * 0.3137147, size.height * 0.8431345);
    path_0.lineTo(size.width * 0.3429107, size.height * 0.8431345);
    path_0.lineTo(size.width * 0.3429107, size.height * 0.7421569);
    path_0.lineTo(size.width * 0.3429135, size.height * 0.7421485);
    path_0.close();
    path_0.moveTo(size.width * 0.2845288, size.height * 0.7629496);
    path_0.cubicTo(
        size.width * 0.2750476,
        size.height * 0.7660000,
        size.width * 0.2652205,
        size.height * 0.7689636,
        size.width * 0.2553300,
        size.height * 0.7717619);
    path_0.lineTo(size.width * 0.2553300, size.height * 0.8431457);
    path_0.lineTo(size.width * 0.2845288, size.height * 0.8431457);
    path_0.lineTo(size.width * 0.2845288, size.height * 0.7629496);
    path_0.close();
    path_0.moveTo(size.width * 0.2261297, size.height * 0.7794762);
    path_0.cubicTo(
        size.width * 0.2170000,
        size.height * 0.7817395,
        size.width * 0.2074539,
        size.height * 0.7839272,
        size.width * 0.1969452,
        size.height * 0.7861625);
    path_0.lineTo(size.width * 0.1969452, size.height * 0.8431513);
    path_0.lineTo(size.width * 0.2261297, size.height * 0.8431513);
    path_0.lineTo(size.width * 0.2261297, size.height * 0.7794678);
    path_0.lineTo(size.width * 0.2261297, size.height * 0.7794762);
    path_0.close();
    path_0.moveTo(size.width * 0.1677450, size.height * 0.7917675);
    path_0.cubicTo(
        size.width * 0.1583256,
        size.height * 0.7934314,
        size.width * 0.1485014,
        size.height * 0.7949776,
        size.width * 0.1385461,
        size.height * 0.7963585);
    path_0.lineTo(size.width * 0.1385461, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.1677421, size.height * 0.8431541);
    path_0.lineTo(size.width * 0.1677421, size.height * 0.7917675);
    path_0.lineTo(size.width * 0.1677450, size.height * 0.7917675);
    path_0.close();
    path_0.moveTo(size.width * 0.1093573, size.height * 0.7999160);
    path_0.cubicTo(
        size.width * 0.09992651,
        size.height * 0.8009104,
        size.width * 0.09010231,
        size.height * 0.8017563,
        size.width * 0.08015850,
        size.height * 0.8024370);
    path_0.lineTo(size.width * 0.08015850, size.height * 0.8431569);
    path_0.lineTo(size.width * 0.1093573, size.height * 0.8431569);
    path_0.lineTo(size.width * 0.1093573, size.height * 0.7999160);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff1D184B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9701542, size.height * 0.9262913);
    path_1.lineTo(size.width * 0.02953890, size.height * 0.9262913);
    path_1.lineTo(size.width * 0.02953890, size.height * 0.7445742);
    path_1.cubicTo(
        size.width * 0.02959078,
        size.height * 0.7445742,
        size.width * 0.03700432,
        size.height * 0.7452913,
        size.width * 0.05023919,
        size.height * 0.7452913);
    path_1.cubicTo(
        size.width * 0.09945101,
        size.height * 0.7452913,
        size.width * 0.2321484,
        size.height * 0.7357087,
        size.width * 0.4010720,
        size.height * 0.6469440);
    path_1.cubicTo(
        size.width * 0.6132983,
        size.height * 0.5354230,
        size.width * 0.8047651,
        size.height * 0.3423305,
        size.width * 0.9701542,
        size.height * 0.07302801);
    path_1.lineTo(size.width * 0.9701542, size.height * 0.9262885);
    path_1.lineTo(size.width * 0.9701542, size.height * 0.9262913);
    path_1.close();
    path_1.moveTo(size.width * 0.9267824, size.height * 0.2622770);
    path_1.cubicTo(
        size.width * 0.9169107,
        size.height * 0.2754059,
        size.width * 0.9070922,
        size.height * 0.2881569,
        size.width * 0.8975980,
        size.height * 0.3001765);
    path_1.lineTo(size.width * 0.8975980, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.9267824, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.9267824, size.height * 0.2622770);
    path_1.close();
    path_1.moveTo(size.width * 0.8683977, size.height * 0.3363333);
    path_1.cubicTo(
        size.width * 0.8589323,
        size.height * 0.3477843,
        size.width * 0.8491124,
        size.height * 0.3593641,
        size.width * 0.8392118,
        size.height * 0.3707507);
    path_1.lineTo(size.width * 0.8392118, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.8683977, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.8683977, size.height * 0.3363333);
    path_1.close();
    path_1.moveTo(size.width * 0.8100130, size.height * 0.4035602);
    path_1.cubicTo(
        size.width * 0.8004280,
        size.height * 0.4141008,
        size.width * 0.7906037,
        size.height * 0.4246218,
        size.width * 0.7808141,
        size.height * 0.4348347);
    path_1.lineTo(size.width * 0.7808141, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.8100130, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.8100130, size.height * 0.4035602);
    path_1.close();
    path_1.moveTo(size.width * 0.7516282, size.height * 0.4645686);
    path_1.cubicTo(
        size.width * 0.7424150,
        size.height * 0.4737283,
        size.width * 0.7325908,
        size.height * 0.4832437,
        size.width * 0.7224294,
        size.height * 0.4928599);
    path_1.lineTo(size.width * 0.7224294, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.7516282, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.7516282, size.height * 0.4645686);
    path_1.close();
    path_1.moveTo(size.width * 0.6932277, size.height * 0.5197059);
    path_1.cubicTo(
        size.width * 0.6834294,
        size.height * 0.5284678,
        size.width * 0.6736081,
        size.height * 0.5370196,
        size.width * 0.6640432,
        size.height * 0.5451204);
    path_1.lineTo(size.width * 0.6640432, size.height * 0.8431597);
    path_1.lineTo(size.width * 0.6932277, size.height * 0.8431597);
    path_1.lineTo(size.width * 0.6932277, size.height * 0.5197059);
    path_1.close();
    path_1.moveTo(size.width * 0.6348444, size.height * 0.5692381);
    path_1.cubicTo(
        size.width * 0.6249957,
        size.height * 0.5771513,
        size.width * 0.6151715,
        size.height * 0.5848179,
        size.width * 0.6056441,
        size.height * 0.5920252);
    path_1.lineTo(size.width * 0.6056441, size.height * 0.8431541);
    path_1.lineTo(size.width * 0.6348444, size.height * 0.8431541);
    path_1.lineTo(size.width * 0.6348444, size.height * 0.5692381);
    path_1.close();
    path_1.moveTo(size.width * 0.5764597, size.height * 0.6134958);
    path_1.cubicTo(
        size.width * 0.5670461,
        size.height * 0.6202577,
        size.width * 0.5572219,
        size.height * 0.6270784,
        size.width * 0.5472608,
        size.height * 0.6337731);
    path_1.lineTo(size.width * 0.5472608, size.height * 0.8431625);
    path_1.lineTo(size.width * 0.5764597, size.height * 0.8431625);
    path_1.lineTo(size.width * 0.5764597, size.height * 0.6134958);
    path_1.close();
    path_1.moveTo(size.width * 0.5180749, size.height * 0.6527731);
    path_1.cubicTo(
        size.width * 0.5083141,
        size.height * 0.6589356,
        size.width * 0.4984899,
        size.height * 0.6649132,
        size.width * 0.4888761,
        size.height * 0.6705658);
    path_1.lineTo(size.width * 0.4888761, size.height * 0.8431625);
    path_1.lineTo(size.width * 0.5180749, size.height * 0.8431625);
    path_1.lineTo(size.width * 0.5180749, size.height * 0.6527731);
    path_1.close();
    path_1.moveTo(size.width * 0.4596758, size.height * 0.6871961);
    path_1.cubicTo(
        size.width * 0.4501225,
        size.height * 0.6924510,
        size.width * 0.4403026,
        size.height * 0.6976443,
        size.width * 0.4304914,
        size.height * 0.7026387);
    path_1.lineTo(size.width * 0.4304914, size.height * 0.8431653);
    path_1.lineTo(size.width * 0.4596758, size.height * 0.8431653);
    path_1.lineTo(size.width * 0.4596758, size.height * 0.6871989);
    path_1.lineTo(size.width * 0.4596758, size.height * 0.6871961);
    path_1.close();
    path_1.moveTo(size.width * 0.4012968, size.height * 0.7169412);
    path_1.cubicTo(
        size.width * 0.3916614,
        size.height * 0.7214734,
        size.width * 0.3818444,
        size.height * 0.7259048,
        size.width * 0.3721110,
        size.height * 0.7301064);
    path_1.lineTo(size.width * 0.3721110, size.height * 0.8431457);
    path_1.lineTo(size.width * 0.4012968, size.height * 0.8431457);
    path_1.lineTo(size.width * 0.4012968, size.height * 0.7169412);
    path_1.close();
    path_1.moveTo(size.width * 0.3429135, size.height * 0.7421513);
    path_1.cubicTo(
        size.width * 0.3325259,
        size.height * 0.7462353,
        size.width * 0.3229741,
        size.height * 0.7498123,
        size.width * 0.3137147,
        size.height * 0.7530756);
    path_1.lineTo(size.width * 0.3137147, size.height * 0.8431373);
    path_1.lineTo(size.width * 0.3429107, size.height * 0.8431373);
    path_1.lineTo(size.width * 0.3429107, size.height * 0.7421597);
    path_1.lineTo(size.width * 0.3429135, size.height * 0.7421513);
    path_1.close();
    path_1.moveTo(size.width * 0.2845288, size.height * 0.7629524);
    path_1.cubicTo(
        size.width * 0.2750476,
        size.height * 0.7660028,
        size.width * 0.2652205,
        size.height * 0.7689664,
        size.width * 0.2553300,
        size.height * 0.7717647);
    path_1.lineTo(size.width * 0.2553300, size.height * 0.8431485);
    path_1.lineTo(size.width * 0.2845288, size.height * 0.8431485);
    path_1.lineTo(size.width * 0.2845288, size.height * 0.7629524);
    path_1.close();
    path_1.moveTo(size.width * 0.2261297, size.height * 0.7794790);
    path_1.cubicTo(
        size.width * 0.2170000,
        size.height * 0.7817423,
        size.width * 0.2074539,
        size.height * 0.7839300,
        size.width * 0.1969452,
        size.height * 0.7861653);
    path_1.lineTo(size.width * 0.1969452, size.height * 0.8431541);
    path_1.lineTo(size.width * 0.2261297, size.height * 0.8431541);
    path_1.lineTo(size.width * 0.2261297, size.height * 0.7794706);
    path_1.lineTo(size.width * 0.2261297, size.height * 0.7794790);
    path_1.close();
    path_1.moveTo(size.width * 0.1677450, size.height * 0.7917703);
    path_1.cubicTo(
        size.width * 0.1583256,
        size.height * 0.7934342,
        size.width * 0.1485014,
        size.height * 0.7949804,
        size.width * 0.1385461,
        size.height * 0.7963613);
    path_1.lineTo(size.width * 0.1385461, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.1677421, size.height * 0.8431569);
    path_1.lineTo(size.width * 0.1677421, size.height * 0.7917703);
    path_1.lineTo(size.width * 0.1677450, size.height * 0.7917703);
    path_1.close();
    path_1.moveTo(size.width * 0.1093573, size.height * 0.7999188);
    path_1.cubicTo(
        size.width * 0.09992651,
        size.height * 0.8009132,
        size.width * 0.09010231,
        size.height * 0.8017591,
        size.width * 0.08015850,
        size.height * 0.8024398);
    path_1.lineTo(size.width * 0.08015850, size.height * 0.8431597);
    path_1.lineTo(size.width * 0.1093573, size.height * 0.8431597);
    path_1.lineTo(size.width * 0.1093573, size.height * 0.7999188);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff1D184B).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9701542, size.height * 0.9262885);
    path_2.lineTo(size.width * 0.02953890, size.height * 0.9262885);
    path_2.lineTo(size.width * 0.02953890, size.height * 0.7445714);
    path_2.cubicTo(
        size.width * 0.02959078,
        size.height * 0.7445714,
        size.width * 0.03700432,
        size.height * 0.7452885,
        size.width * 0.05023919,
        size.height * 0.7452885);
    path_2.cubicTo(
        size.width * 0.09945101,
        size.height * 0.7452885,
        size.width * 0.2321484,
        size.height * 0.7357059,
        size.width * 0.4010720,
        size.height * 0.6469412);
    path_2.cubicTo(
        size.width * 0.6132983,
        size.height * 0.5354202,
        size.width * 0.8047651,
        size.height * 0.3423277,
        size.width * 0.9701542,
        size.height * 0.07302521);
    path_2.lineTo(size.width * 0.9701542, size.height * 0.9262857);
    path_2.lineTo(size.width * 0.9701542, size.height * 0.9262885);
    path_2.close();
    path_2.moveTo(size.width * 0.9267824, size.height * 0.2622745);
    path_2.cubicTo(
        size.width * 0.9169107,
        size.height * 0.2754034,
        size.width * 0.9070922,
        size.height * 0.2881541,
        size.width * 0.8975980,
        size.height * 0.3001737);
    path_2.lineTo(size.width * 0.8975980, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.9267824, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.9267824, size.height * 0.2622745);
    path_2.close();
    path_2.moveTo(size.width * 0.8683977, size.height * 0.3363305);
    path_2.cubicTo(
        size.width * 0.8589323,
        size.height * 0.3477815,
        size.width * 0.8491124,
        size.height * 0.3593613,
        size.width * 0.8392118,
        size.height * 0.3707479);
    path_2.lineTo(size.width * 0.8392118, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.8683977, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.8683977, size.height * 0.3363305);
    path_2.close();
    path_2.moveTo(size.width * 0.8100130, size.height * 0.4035574);
    path_2.cubicTo(
        size.width * 0.8004280,
        size.height * 0.4140980,
        size.width * 0.7906037,
        size.height * 0.4246190,
        size.width * 0.7808141,
        size.height * 0.4348319);
    path_2.lineTo(size.width * 0.7808141, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.8100130, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.8100130, size.height * 0.4035574);
    path_2.close();
    path_2.moveTo(size.width * 0.7516282, size.height * 0.4645658);
    path_2.cubicTo(
        size.width * 0.7424150,
        size.height * 0.4737255,
        size.width * 0.7325908,
        size.height * 0.4832409,
        size.width * 0.7224294,
        size.height * 0.4928571);
    path_2.lineTo(size.width * 0.7224294, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.7516282, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.7516282, size.height * 0.4645658);
    path_2.close();
    path_2.moveTo(size.width * 0.6932277, size.height * 0.5197031);
    path_2.cubicTo(
        size.width * 0.6834294,
        size.height * 0.5284650,
        size.width * 0.6736081,
        size.height * 0.5370168,
        size.width * 0.6640432,
        size.height * 0.5451176);
    path_2.lineTo(size.width * 0.6640432, size.height * 0.8431569);
    path_2.lineTo(size.width * 0.6932277, size.height * 0.8431569);
    path_2.lineTo(size.width * 0.6932277, size.height * 0.5197031);
    path_2.close();
    path_2.moveTo(size.width * 0.6348444, size.height * 0.5692353);
    path_2.cubicTo(
        size.width * 0.6249957,
        size.height * 0.5771485,
        size.width * 0.6151715,
        size.height * 0.5848151,
        size.width * 0.6056441,
        size.height * 0.5920224);
    path_2.lineTo(size.width * 0.6056441, size.height * 0.8431513);
    path_2.lineTo(size.width * 0.6348444, size.height * 0.8431513);
    path_2.lineTo(size.width * 0.6348444, size.height * 0.5692353);
    path_2.close();
    path_2.moveTo(size.width * 0.5764597, size.height * 0.6134930);
    path_2.cubicTo(
        size.width * 0.5670461,
        size.height * 0.6202549,
        size.width * 0.5572219,
        size.height * 0.6270756,
        size.width * 0.5472608,
        size.height * 0.6337703);
    path_2.lineTo(size.width * 0.5472608, size.height * 0.8431597);
    path_2.lineTo(size.width * 0.5764597, size.height * 0.8431597);
    path_2.lineTo(size.width * 0.5764597, size.height * 0.6134930);
    path_2.close();
    path_2.moveTo(size.width * 0.5180749, size.height * 0.6527703);
    path_2.cubicTo(
        size.width * 0.5083141,
        size.height * 0.6589328,
        size.width * 0.4984899,
        size.height * 0.6649104,
        size.width * 0.4888761,
        size.height * 0.6705630);
    path_2.lineTo(size.width * 0.4888761, size.height * 0.8431597);
    path_2.lineTo(size.width * 0.5180749, size.height * 0.8431597);
    path_2.lineTo(size.width * 0.5180749, size.height * 0.6527703);
    path_2.close();
    path_2.moveTo(size.width * 0.4596758, size.height * 0.6871933);
    path_2.cubicTo(
        size.width * 0.4501225,
        size.height * 0.6924482,
        size.width * 0.4403026,
        size.height * 0.6976415,
        size.width * 0.4304914,
        size.height * 0.7026359);
    path_2.lineTo(size.width * 0.4304914, size.height * 0.8431625);
    path_2.lineTo(size.width * 0.4596758, size.height * 0.8431625);
    path_2.lineTo(size.width * 0.4596758, size.height * 0.6871961);
    path_2.lineTo(size.width * 0.4596758, size.height * 0.6871933);
    path_2.close();
    path_2.moveTo(size.width * 0.4012968, size.height * 0.7169384);
    path_2.cubicTo(
        size.width * 0.3916614,
        size.height * 0.7214706,
        size.width * 0.3818444,
        size.height * 0.7259020,
        size.width * 0.3721110,
        size.height * 0.7301036);
    path_2.lineTo(size.width * 0.3721110, size.height * 0.8431429);
    path_2.lineTo(size.width * 0.4012968, size.height * 0.8431429);
    path_2.lineTo(size.width * 0.4012968, size.height * 0.7169384);
    path_2.close();
    path_2.moveTo(size.width * 0.3429135, size.height * 0.7421485);
    path_2.cubicTo(
        size.width * 0.3325259,
        size.height * 0.7462325,
        size.width * 0.3229741,
        size.height * 0.7498095,
        size.width * 0.3137147,
        size.height * 0.7530728);
    path_2.lineTo(size.width * 0.3137147, size.height * 0.8431345);
    path_2.lineTo(size.width * 0.3429107, size.height * 0.8431345);
    path_2.lineTo(size.width * 0.3429107, size.height * 0.7421569);
    path_2.lineTo(size.width * 0.3429135, size.height * 0.7421485);
    path_2.close();
    path_2.moveTo(size.width * 0.2845288, size.height * 0.7629496);
    path_2.cubicTo(
        size.width * 0.2750476,
        size.height * 0.7660000,
        size.width * 0.2652205,
        size.height * 0.7689636,
        size.width * 0.2553300,
        size.height * 0.7717619);
    path_2.lineTo(size.width * 0.2553300, size.height * 0.8431457);
    path_2.lineTo(size.width * 0.2845288, size.height * 0.8431457);
    path_2.lineTo(size.width * 0.2845288, size.height * 0.7629496);
    path_2.close();
    path_2.moveTo(size.width * 0.2261297, size.height * 0.7794762);
    path_2.cubicTo(
        size.width * 0.2170000,
        size.height * 0.7817395,
        size.width * 0.2074539,
        size.height * 0.7839272,
        size.width * 0.1969452,
        size.height * 0.7861625);
    path_2.lineTo(size.width * 0.1969452, size.height * 0.8431513);
    path_2.lineTo(size.width * 0.2261297, size.height * 0.8431513);
    path_2.lineTo(size.width * 0.2261297, size.height * 0.7794678);
    path_2.lineTo(size.width * 0.2261297, size.height * 0.7794762);
    path_2.close();
    path_2.moveTo(size.width * 0.1677450, size.height * 0.7917675);
    path_2.cubicTo(
        size.width * 0.1583256,
        size.height * 0.7934314,
        size.width * 0.1485014,
        size.height * 0.7949776,
        size.width * 0.1385461,
        size.height * 0.7963585);
    path_2.lineTo(size.width * 0.1385461, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.1677421, size.height * 0.8431541);
    path_2.lineTo(size.width * 0.1677421, size.height * 0.7917675);
    path_2.lineTo(size.width * 0.1677450, size.height * 0.7917675);
    path_2.close();
    path_2.moveTo(size.width * 0.1093573, size.height * 0.7999160);
    path_2.cubicTo(
        size.width * 0.09992651,
        size.height * 0.8009104,
        size.width * 0.09010231,
        size.height * 0.8017563,
        size.width * 0.08015850,
        size.height * 0.8024370);
    path_2.lineTo(size.width * 0.08015850, size.height * 0.8431569);
    path_2.lineTo(size.width * 0.1093573, size.height * 0.8431569);
    path_2.lineTo(size.width * 0.1093573, size.height * 0.7999160);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../svgs/svgs.dart' as svgs;
import '../../global_variables.dart' as global;

class GBloxCards extends StatefulWidget {
  @required
  late int backgroundColor;
  @required
  late String? svg;
  @required
  late String text;
  @required
  late Color textBackgroundColor;
  @required
  late final Function? pressed;
  late final bool compressSVG;
  GBloxCards(
      {Key? key,
      this.backgroundColor = 0xff060841,
      this.text = "Code",
      this.pressed,
      this.textBackgroundColor = Colors.orange,
      this.svg,
      this.compressSVG = false});
  @override
  State<StatefulWidget> createState() {
    return _GBloxCardsState();
  }
}

class _GBloxCardsState extends State<GBloxCards> {
  late Widget card = Container();
  _GBloxCardsState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 50,
      width: 200,
      child: InkWell(
          customBorder: const BeveledRectangleBorder(
              side: BorderSide(color: Colors.red, width: 50),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          onTap: () {
            widget.pressed!();
          },
          child: Card(
              clipBehavior: Clip.hardEdge,
              color: Theme.of(global.navigatorKey.currentContext!).primaryColor,
              shape: const BeveledRectangleBorder(
                  side: BorderSide(color: Color(0xff0000dc), width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Container(
                width: global.device_size.width * 0.25,
                decoration: BoxDecoration(
                  color: Theme.of(global.navigatorKey.currentContext!)
                      .primaryColor,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Theme.of(global.navigatorKey.currentContext!)
                                .primaryColor,
                          ),
                          width: global.device_size.width * 0.5,
                          height: global.device_size.height * 0.35,
                          clipBehavior: Clip.none,
                          margin: widget.compressSVG
                              ? const EdgeInsets.fromLTRB(0, 20, 0, 0)
                              : const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          padding: widget.compressSVG
                              ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
                              : const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: SvgPicture.string(widget.svg!,
                              height: widget.compressSVG
                                  ? global.device_size.height * 0.12
                                  : global.device_size.height * 0.12,
                              allowDrawingOutsideViewBox: true,
                              clipBehavior: Clip.none,
                              fit: widget.compressSVG
                                  ? BoxFit.cover
                                  : BoxFit.contain)),
                      SizedBox(height: global.device_size.height * 0.05),
                      Container(
                          clipBehavior: Clip.hardEdge,
                          margin: widget.compressSVG
                              ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
                              : const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          alignment: Alignment.center,
                          height: global.device_size.height * 0.08,
                          decoration: BoxDecoration(
                              color: widget.textBackgroundColor,
                              border: Border.all(color: Colors.blueAccent)),
                          child: Text(
                            widget.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: global.device_size.height * 0.04),
                          ).tr())
                    ]),
              ))),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../svgs/svgs.dart' as svgs;

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
  GBloxCards(
      {Key? key,
      this.backgroundColor = 0xff060841,
      this.text = "Code",
      this.pressed,
      this.textBackgroundColor = Colors.orange,
      this.svg});
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
        child: InkWell(
            customBorder: const BeveledRectangleBorder(
                side: BorderSide(color: Colors.red, width: 50),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            onTap: () {
              widget.pressed!();
            },
            child: Container(
              height: 200,
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      color: Color(widget.backgroundColor),
                      shape: const BeveledRectangleBorder(
                          side: BorderSide(color: Color(0xff0000dc), width: 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0))),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(widget.backgroundColor),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  color: Color(widget.backgroundColor),
                                  child: SvgPicture.string(widget.svg!,
                                      height: 120,
                                      clipBehavior: Clip.none,
                                      fit: BoxFit.cover)),
                              Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 500,
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: widget.textBackgroundColor,
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: Text(
                                    widget.text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                  ).tr())
                            ]),
                      ))),
            ))));
  }
}

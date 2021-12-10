import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../svgs/svgs.dart' as svgs;

class BluetoothCard extends StatefulWidget {
  @required
  BluetoothDevice? device;
  String? type;
  GestureTapCallback? onTap;
  GestureLongPressCallback? onLongPress;
  bool? enabled;
  BluetoothCard(
      {Key? key,
      this.device,
      this.type,
      this.onTap,
      this.enabled,
      this.onLongPress});

  @override
  State<StatefulWidget> createState() {
    return _BluetoothCardState();
  }
}

class _BluetoothCardState extends State<BluetoothCard> {
  late String _cardSVG;
  late Color _textBackgroundColor;

  _BluetoothCardState();

  void initState() {
    super.initState();
    switch (widget.type) {
      case "Mingo":
        _cardSVG = svgs.mingo;
        _textBackgroundColor = Colors.purple;
        break;
      case "Mello":
        _cardSVG = svgs.mello;
        _textBackgroundColor = Colors.green;
        break;
      default:
        _cardSVG = svgs.arduino;
        _textBackgroundColor = Colors.blue;
        break;
    }
  }

  Widget build(BuildContext context) {
    return (InkWell(
        onLongPress: widget.onLongPress,
        customBorder: const BeveledRectangleBorder(
            side: BorderSide(color: Colors.red, width: 50),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        onTap: () {
          widget.onTap!();
        },
        child: Container(
            height: 200,
            width: 200,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: const Color(0xff060841),
                    shape: const BeveledRectangleBorder(
                        side: BorderSide(color: Color(0xff0000dc), width: 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0))),
                    child: Container(
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xff060841),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.string(
                                          _cardSVG,
                                          alignment: Alignment.center,
                                        ),
                                        Column(children: [
                                          widget.device!.isConnected
                                              ? Icon(Icons.import_export,
                                                  color: Colors.green)
                                              : Container(),
                                          widget.device!.isBonded
                                              ? const Icon(Icons.link,
                                                  color: Colors.white)
                                              : Container(width: 0, height: 0),
                                        ])
                                      ])),
                              Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: 500,
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: _textBackgroundColor,
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: Text(widget.device!.name.toString()))
                            ])))))));
  }
}

import 'package:flutter/material.dart';
import '../global_variables.dart' as global;
import 'dart:convert';
import 'dart:typed_data';

class _KeyClass {
  String pKey;
  bool acc;
  bool empty;

  _KeyClass(this.pKey, this.acc, this.empty);
}

class PianoKeys extends StatefulWidget {
  @required
  List<String> keys;
  @required
  PianoKeys({
    Key? key,
    this.keys = const [
      "C4",
      "C#4",
      "D4",
      "D#4",
      "E4",
      "F4",
      "F#4",
      "G4",
      "G#4",
      "A4",
      "A#4",
      "B4",
      "C5",
      "C#5",
      "D5",
      "D#5",
      "E5",
      "F5",
      "F#5",
      "G5",
      "G#5",
      "A5",
      "A#5",
      "B5",
      "C6"
    ],
  }) : super(key: key);

  @override
  _PianoKeysState createState() => _PianoKeysState();
}

class _PianoKeysState extends State<PianoKeys> {
  late List<_KeyClass> note = List<_KeyClass>.empty(growable: true);
  late List<_KeyClass> accidental = List<_KeyClass>.empty(growable: true);
  late List<Widget> allKeys = List<Widget>.empty(growable: true);

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.keys.length; i++) {
      if (widget.keys[i].contains("#")) {
        accidental.add(_KeyClass(widget.keys[i], true, false));
      } else {
        try {
          var lastAcc = accidental.last;
          //print(widget.keys[i][0]);
          if (widget.keys[i - 1].contains(lastAcc.pKey[0])) {
            note.add(_KeyClass(widget.keys[i], false, false));
          } else {
            accidental.add(_KeyClass(widget.keys[i], true, true));
            note.add(_KeyClass(widget.keys[i], false, false));
          }
        } catch (e) {
          //print(accidental);
          note.add(_KeyClass(widget.keys[i], false, false));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0B0533),
      ),
      home: Scaffold(
          appBar: AppBar(
              title: const Text("Piano"),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))),
          body: Container(
              child:Stack(
                    children: [
                      Container(
                          height: global.device_height * 0.85,
                          child: Row(
                            children: note
                                .map((e) => PianoKey(
                                      accidental: e.acc,
                                      pianoKey: e.pKey,
                                      empty: e.empty,
                                      pressed: () {
                                        var commandArgs = "";
                                        if(e.acc==false){
                                          commandArgs = commandArgs +  e.pKey[0] + " " + e.pKey[1];
                                        } else{
                                          commandArgs = commandArgs +  e.pKey[0] + "" + e.pKey[1] + " " + e.pKey[2];
                                          //global.displayToast(commandArgs);
                                        }
                                          //global.displayToast("p " + commandArgs + ";");
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(utf8.encode(
                                                  "p " + commandArgs + ";")));
                                        } catch (e) {
                                          //print(e);
                                        }
                                      },
                                      onRelease: () {
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(utf8.encode(
                                                  "pn;")));
                                          print("Key Released");
                                        } catch (e) {
                                          //print(e);
                                        }
                                      },
                                    ))
                                .toList(),
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              global.device_width * 0.03, 0, 0, 0),
                          alignment: Alignment.topCenter,
                          height: global.device_height * 0.5,
                          child: Row(
                              children: accidental
                                  .map((e) => PianoKey(
                                        accidental: e.acc,
                                        pianoKey: e.pKey,
                                        empty: e.empty,
                                        pressed: () {
                                        var commandArgs = "";
                                        if(e.acc==false){
                                          commandArgs = commandArgs +  e.pKey[0] + " " + e.pKey[1];
                                        } else{
                                          commandArgs = commandArgs +  e.pKey[0] + "" + e.pKey[1] + " " + e.pKey[2];
                                          //global.displayToast(commandArgs);
                                        }
                                          //global.displayToast("p " + commandArgs + ";");
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(utf8.encode(
                                                  "p " + commandArgs + ";")));
                                        } catch (e) {
                                          //print(e);
                                        }
                                      },
                                      onRelease: () {
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(utf8.encode(
                                                  "pn;")));
                                          print("Key Released");
                                        } catch (e) {
                                          //print(e);
                                        }
                                      },
                                      ))
                                  .toList()))
                    ],
                  ))),
    );
  }
}

class PianoKey extends StatefulWidget {
  @required
  String pianoKey;
  @required
  bool accidental;
  @required
  bool empty;
  Function? pressed;
  @required
  Function? onRelease;
  PianoKey(
      {Key? key,
      this.pianoKey = "C4",
      this.accidental = false,
      this.pressed,
      this.onRelease,
      this.empty = false});
  @override
  State<StatefulWidget> createState() {
    return _PianoKeyState();
  }
}

class _PianoKeyState extends State<PianoKey> {
  bool state = false;
  double keyWidth = global.device_width * 0.0665;
  @override
  Widget build(BuildContext context) {
    switch (widget.empty) {
      case true:
        return Container(width: keyWidth);
        break;
      case false:
        return InkWell(
            enableFeedback: false,
            radius: 0,
            borderRadius: const BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(10)),
            onTapDown: (TapDownDetails) {
              widget.pressed!();
              setState(() {
                state = true;
              });
            },
            onTapCancel: () {
              widget.onRelease!();
              setState(() {
                state = false;
              });
            },
            onTap: () {
              widget.onRelease!();
              setState(() {
                state = false;
              });
            },
            child: Container(
                width: keyWidth,
                alignment: Alignment.center,
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    width: widget.accidental ? keyWidth * 0.9 : keyWidth,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(10)),
                        color: widget.accidental
                            ? state
                                ? HSLColor.fromColor(Colors.black)
                                    .withLightness(0.2)
                                    .toColor()
                                : Colors.black
                            : state
                                ? HSLColor.fromColor(Colors.white)
                                    .withLightness(0.2)
                                    .toColor()
                                : Colors.white),
                    child: Text(
                      widget.pianoKey,
                      style: widget.accidental
                          ? TextStyle(
                              color: Colors.white,
                            )
                          : TextStyle(color: Colors.black),
                    ))));
        break;
      default:
        return Container(width: keyWidth);
        break;
    }
  }
}

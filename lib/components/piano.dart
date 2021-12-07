import 'package:flutter/material.dart';
import 'package:piano/piano.dart';

class PianoApp extends StatefulWidget {
  const PianoApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PianoAppState();
  }
}

class _PianoAppState extends State<PianoApp> {
  _PianoAppState();

  @override
  void initState() {
    super.initState();

    load();
  }

  void load() async {}

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
          ),
          body: InteractivePiano(
            naturalColor: Colors.white,
            accidentalColor: Colors.black,
            keyWidth: 54,
            noteRange: NoteRange.forClefs([
              Clef.Bass,
              Clef.Treble,
              Clef.Alto,
            ]),
            onNotePositionTapped: (position) {
              print(position.pitch);
            },
          ),
        ));
  }
}

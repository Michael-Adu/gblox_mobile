import 'package:flutter/material.dart';
import 'package:piano/piano.dart';

class PianoApp extends StatelessWidget {
  const PianoApp({Key? key}) : super(key: key);
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
              print(position);
              // Use an audio library like flutter_midi to play the sound
            },
          ),
        ));
  }
}

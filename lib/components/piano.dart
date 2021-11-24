import 'package:flutter/material.dart';
import 'package:piano/piano.dart';

class PianoApp extends StatelessWidget {
  @override
  const PianoApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
          cardTheme: const CardTheme(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          )),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Piano"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: InteractivePiano(
            highlightedNotes: [NotePosition(note: Note.C, octave: 3)],
            naturalColor: Colors.white,
            accidentalColor: const Color(0xff0000DC),
            keyWidth: 60,
            noteRange: NoteRange.forClefs([
              Clef.Treble,
            ]),
            onNotePositionTapped: (position) {
              print(position);
              // Use an audio library like flutter_midi to play the sound
            },
          ),
        ));
  }
}

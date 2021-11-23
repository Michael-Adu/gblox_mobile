import 'package:flutter/material.dart';
import 'package:piano/piano.dart';

class PianoApp extends StatelessWidget {
  @override
  const PianoApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Piano"), centerTitle: true),
      body: InteractivePiano(
        highlightedNotes: [NotePosition(note: Note.C, octave: 3)],
        naturalColor: Colors.white,
        accidentalColor: Colors.black,
        keyWidth: 60,
        noteRange: NoteRange.forClefs([
          Clef.Treble,
        ]),
        onNotePositionTapped: (position) {
          // Use an audio library like flutter_midi to play the sound
        },
      ),
    ));
  }
}

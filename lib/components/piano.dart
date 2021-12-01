import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';

class PianoApp extends StatefulWidget {
  const PianoApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PianoAppState();
  }
}

class _PianoAppState extends State<PianoApp> {
  _PianoAppState();
  late FlutterMidi playSound;
  @override
  void initState() {
    super.initState();

    load();
  }

  void load() async {
    // FlutterMidi().unmute;
    ByteData _byte = await rootBundle.load("assets/sounds/Piano.SF2");
    // FlutterMidi().prepare(sf2: _byte);
  }

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
              // playSound.playMidiNote(midi: position.pitch);
              // Use an audio library like flutter_midi to play the sound
            },
          ),
        ));
  }
}

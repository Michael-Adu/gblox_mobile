import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'global_variables.dart' as global;
import 'dart:convert';
import 'dart:typed_data';

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
              //Clef.Bass,
              Clef.Treble,
              //Clef.Alto,
            ]),
            onNotePositionTapped: (position) {
              print(position.pitch);
              // playSound.playMidiNote(midi: position.pitch);
              print(position);
              var commandArgs = "";
              if(position.note == Note.A && position.accidental == Accidental.None){
                commandArgs = "A " + position.octave.toString();
              } else if(position.note == Note.A && position.accidental == Accidental.Sharp){
                commandArgs = "A# " + position.octave.toString();
              } else if(position.note == Note.B && position.accidental == Accidental.None){
                commandArgs = "B " + position.octave.toString();
              } else if(position.note == Note.C && position.accidental == Accidental.None){
                commandArgs = "C " + position.octave.toString();
              } else if(position.note == Note.C && position.accidental == Accidental.Sharp){
                commandArgs = "C# " + position.octave.toString();
              } else if(position.note == Note.D && position.accidental == Accidental.None){
                commandArgs = "D " + position.octave.toString();
              } else if(position.note == Note.D && position.accidental == Accidental.Sharp){
                commandArgs = "D# " + position.octave.toString();
              } else if(position.note == Note.E && position.accidental == Accidental.None){
                commandArgs = "E " + position.octave.toString();
              } else if(position.note == Note.F && position.accidental == Accidental.None){
                commandArgs = "F " + position.octave.toString();
              } else if(position.note == Note.F && position.accidental == Accidental.Sharp){
                commandArgs = "F# " + position.octave.toString();
              } else if(position.note == Note.G && position.accidental == Accidental.None){
                commandArgs = "G " + position.octave.toString();
              } else if(position.note == Note.G && position.accidental == Accidental.Sharp){
                commandArgs = "G# " + position.octave.toString();
              } 
              try {
                global.activeConnection.output
                    .add(Uint8List.fromList(utf8.encode("piano " + commandArgs)));
                print(global.activeConnection);
              } catch (e) {
                print(e);
              }
              // Use an audio library like flutter_midi to play the sound
            },
          ),
        ));
  }
}

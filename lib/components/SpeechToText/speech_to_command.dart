import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:easy_localization/easy_localization.dart';
import '../global_variables.dart' as global;

class SpeechToCommand extends StatefulWidget {
  const SpeechToCommand({Key? key}) : super(key: key);

  @override
  _SpeechToCommandState createState() => _SpeechToCommandState();
}

class _SpeechToCommandState extends State<SpeechToCommand> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
    );
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Speech to Command',
                      style:
                          TextStyle(fontSize: global.device_size.height * 0.04))
                  .tr(),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                    width: global.device_size.width * 0.7,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      _lastWords.length != 0
                          ? '$_lastWords'
                          : _speechEnabled
                              ? 'Tap the microphone to start listening...'
                              : 'Speech not available',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: global.device_size.height * 0.05),
                    ),
                  ),
                  Container(
                    width: global.device_size.width * 0.3,
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      onPressed:
                          // If not yet listening for speech start, otherwise stop
                          _speechToText.isNotListening
                              ? _startListening
                              : _stopListening,
                      tooltip: 'Listen',
                      child: Icon(_speechToText.isNotListening
                          ? Icons.mic_off
                          : Icons.mic),
                    ),
                  )
                ]))));
  }
}

# Speech to Command

<aside>
💡 Converts voice commands into actual commands to be sent to the robot

</aside>

# Packages used:

1. [Speech to text](https://pub.dev/packages/speech_to_text)

# Speech to Text

- Upon tapping the microphone `IconButton`, the device should listen for specific voice commands and send instructions to the robot accordingly.
- The speech recognition engine is started when the page is loaded.

```dart
void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }
```

- When the user touches the microphone button, a function is called to let the device start listening for the engine. Upon recognition, the last words spoken are updated and shown on the left.
    
    ```dart
    
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
    ```
    
    ```dart
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
    ```
    

# What is Left?

- Creating a reference dictionary for commands.
- Once a command is issued, the appropriate string should be sent to the robot.
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'global_variables.dart' as global;

class Blockly extends StatefulWidget {
  const Blockly({Key? key}) : super(key: key);

  @override
  _BlocklyState createState() => _BlocklyState();
}

class _BlocklyState extends State<Blockly> {
  late InAppWebViewController? controller;
  late List<String> toolbox;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("code_mode").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(0);
                ''');
                        },
                        child: Container(
                            child: const Text("Logic",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            width: 200,
                            height: 25,
                            alignment: Alignment.center,
                            color: Colors.blue)),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(1);
                ''');
                        },
                        child: Container(
                          color: Colors.red,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                          child: const Text("Loop",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(2);
                ''');
                        },
                        child: Container(
                          color: Colors.yellow,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                          child: const Text("Math",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(3);
                ''');
                        },
                        child: Container(
                          color: Colors.amber,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                          child: const Text("Text",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(4);
                ''');
                        },
                        child: Container(
                            child: const Text("Digital",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                            width: 200,
                            height: 25,
                            alignment: Alignment.center,
                            color: Colors.blue)),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(5);
                ''');
                        },
                        child: Container(
                          child: const Text("Analog",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          color: Colors.red,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(6);
                ''');
                        },
                        child: Container(
                          child: const Text("Sensors",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          color: Colors.deepPurple,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(7);
                ''');
                        },
                        child: Container(
                          child: const Text("Actuators",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          color: Colors.orange,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(8);
                ''');
                        },
                        child: Container(
                          child: const Text("Communication",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          color: Colors.teal,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                        )),
                    InkWell(
                        onTap: () {
                          controller!.evaluateJavascript(source: '''
                clickOnToolbox(9);
                ''');
                        },
                        child: Container(
                          child: const Text(
                            "Variables",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          color: Colors.cyan,
                          width: 200,
                          height: 25,
                          alignment: Alignment.center,
                        )),
                  ],
                ),
                Container(
                    width: 600,
                    alignment: Alignment.centerRight,
                    child: InAppWebView(
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true,
                            mediaPlaybackRequiresUserGesture: false,
                          ),
                          android: AndroidInAppWebViewOptions(
                            useHybridComposition: true,
                          ),
                          ios: IOSInAppWebViewOptions(
                            allowsInlineMediaPlayback: true,
                          )),
                      initialFile:
                          'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html',
                      onWebViewCreated: (InAppWebViewController defcontroller) {
                        controller = defcontroller;
                        defcontroller.addJavaScriptHandler(
                            handlerName: "sendToFlutter",
                            callback: (args) {
                              print(args);
                            });
                        defcontroller.addJavaScriptHandler(
                            handlerName: "toolBoxReturn",
                            callback: (args) {
                              print(args);
                            });
                      },
                      onConsoleMessage: (InAppWebViewController controller,
                          ConsoleMessage consoleMessage) {
                        print("console message: ${consoleMessage.message}");
                      },
                    )),
              ],
            )));
  }
}

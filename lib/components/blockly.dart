import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Blockly extends StatelessWidget {
  @override
  const Blockly({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Blockly"), centerTitle: true),
            body: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
                  'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html',
              onWebViewCreated: (controller) {
                controller.loadUrl(
                    'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html');
              },
            )));
  }
}

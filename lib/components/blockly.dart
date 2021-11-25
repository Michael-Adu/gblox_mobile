import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Blockly extends StatelessWidget {
  const Blockly({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            body: WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
                name: 'Print',
                onMessageReceived: (JavascriptMessage message) {
                  print(message.message);
                })
          ]),
          initialUrl:
              'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html',
          onWebViewCreated: (controller) {
            controller.loadUrl(
                'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html');
          },
        )));
  }
}

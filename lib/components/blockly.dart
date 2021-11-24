import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Blockly extends StatelessWidget {
  @override
  const Blockly({Key? key}) : super(key: key);
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
                title: Text("Blockly"),
                centerTitle: true,
                backgroundColor: Colors.transparent),
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

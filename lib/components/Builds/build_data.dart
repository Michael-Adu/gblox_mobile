import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../global_variables.dart' as global;

class Builddata extends StatefulWidget {
  const Builddata({Key? key}) : super(key: key);

  @override
  _BuilddataState createState() => _BuilddataState();
}

class _BuilddataState extends State<Builddata> {
  String pathPDF = 'assets/svgs/dsadsa.pdf';
  var pdfController;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: Text("build_mode",
                      style: TextStyle(fontSize: global.device_height * 0.04))
                  .tr(),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Container(
                child: PdfView(
              controller: PdfController(
                  document: PdfDocument.openAsset(pathPDF),
                  viewportFraction: 1),
            ))));
  }
}

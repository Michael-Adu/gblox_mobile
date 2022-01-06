import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import '../global_variables.dart' as global;
import 'package:flutter/services.dart';
import '../svgs/svgs.dart' as svgs;
import 'dart:math' as math;
import '../Modular_Widgets/Button/buttons.dart';
import '../Modular_Widgets/Selector/selector_buttons.dart';
import 'blockly.dart';

class OpenProject extends StatefulWidget {
  final bool fromHome;
  OpenProject({Key? key, this.fromHome = false}) : super(key: key);

  @override
  _OpenProjectState createState() => _OpenProjectState();
}

class _OpenProjectState extends State<OpenProject> {
  List<FileSystemEntity> _folders =
      List<FileSystemEntity>.empty(growable: true);
  List<FileSystemEntity> _internal_folders =
      List<FileSystemEntity>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    var gbloxFolder = createFolderInAppDocDir("GBlox");
    getDir("GBlox");
    print(_folders);
  }

  Future<String> createFolderInAppDocDir(String folderName) async {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  Future<void> getDir(String folderName) async {
    final directory = await getApplicationDocumentsDirectory();
    final dir = directory.path;
    String gBloxDirectory = '$dir/$folderName';
    final myDir = Directory(gBloxDirectory);
    try {
      setState(() {
        _folders = myDir.listSync(recursive: true, followLinks: false);
      });
      print(_folders);
    } catch (e) {}
  }

  Future<void> getInteralDir() async {
    final directory = await getExternalStorageDirectory();
    try {
      setState(() {
        _internal_folders = directory!.listSync(recursive: true);
      });
      print("Internal Files");
      print(_internal_folders);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(global.navigatorKey.currentContext!),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Open').tr(),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: global.device_width * 0.3,
                  child: SelectorButtons(
                    activeColor: 0xff0000DC,
                    buttons: ["GBlox", "SD Card", "Phone"],
                    functionList: [() {}, () {}, () {}],
                  )),
              Container(
                  width: global.device_width * 0.7,
                  decoration: BoxDecoration(color: const Color(0xff0B0533)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _folders.map((e) {
                        List<String> pathName = e.toString().split("/");
                        String fileName = pathName.last.replaceAll("'", '');
                        return Container(
                            width: global.device_width * 0.5,
                            child: GBloxButtons(
                                buttonType: "fileButtons",
                                buttonName: fileName,
                                pressed: () async {
                                  File file = File(await e.path);
                                  String xml = await file.readAsString();
                                  if (widget.fromHome) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Blockly(
                                                initialXML: xml,
                                              )),
                                    );
                                  } else {
                                    Navigator.pop(context, xml);
                                  }
                                }));
                      }).toList()))
            ],
          ),
        ),
      ),
    );
  }
}

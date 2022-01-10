import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import '../../global_variables.dart' as global;
import 'package:flutter/services.dart';
import '../../svgs/svgs.dart' as svgs;
import 'dart:math' as math;
import '../../Modular_Widgets/Button/buttons.dart';
import '../../Modular_Widgets/Selector/selector_buttons.dart';
import '../../Blockly/blockly.dart';
import '../../Blockly/open_project.dart';

class CodeMenu extends StatefulWidget {
  const CodeMenu({Key? key}) : super(key: key);

  @override
  _CodeMenuState createState() => _CodeMenuState();
}

class _CodeMenuState extends State<CodeMenu> {
  List<FileSystemEntity> _folders =
      List<FileSystemEntity>.empty(growable: true);
  List<FileSystemEntity> _internal_folders =
      List<FileSystemEntity>.empty(growable: true);
  int index = 0;

  @override
  void initState() {
    super.initState();
    var gbloxFolder = createFolderInAppDocDir("GBlox");
    getDir("GBlox");
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
    } catch (e) {}
  }

  Future<void> getInteralDir() async {
    final directory = await getExternalStorageDirectory();
    try {
      setState(() {
        _internal_folders = directory!.listSync(recursive: true);
      });
    } catch (e) {}
  }

  _launchURL() async {
    const url = 'https://mingoblox.business.site/';
    if (await canLaunch(url)) {
      await launch(url);
      setState(() {
        index = 0;
      });
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(global.navigatorKey.currentContext!),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home').tr(),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: global.device_width * 0.3,
                  child: SelectorButtons(
                    initialIndex: index,
                    activeColor: 0xff0000DC,
                    buttons: ["Recent", "Help", "Robocentre", "Challenge"],
                    functionList: [
                      () {},
                      () {
                        setState(() {
                          index = 0;
                        });
                        _launchURL();
                      },
                      () {
                        _launchURL();
                      },
                      () {
                        _launchURL();
                      }
                    ],
                  )),
              Container(
                  width: global.device_width * 0.4,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Blockly(
                                              initialXML: xml,
                                            )),
                                  );
                                }));
                      }).toList())),
              Container(
                  width: global.device_width * 0.3,
                  decoration: const BoxDecoration(color: Color(0xff0B0533)),
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.fromLTRB(
                      global.device_width * 0.05,
                      global.device_height * 0.05,
                      global.device_width * 0.05,
                      0),
                  child: Container(
                      alignment: Alignment.topCenter,
                      height: global.device_height * 0.25,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GBloxButtons(
                              buttonType: "projectButtons",
                              buttonName: "New Project",
                              pressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Blockly()),
                                );
                              },
                              buttonColor: 0xff0000DC,
                            ),
                            GBloxButtons(
                              buttonType: "projectButtons",
                              buttonName: "Open",
                              pressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OpenProject(
                                              fromHome: true,
                                            )));
                              },
                              buttonColor: 0xff0000DC,
                            )
                          ])))
            ],
          ),
        ),
      ),
    );
  }
}

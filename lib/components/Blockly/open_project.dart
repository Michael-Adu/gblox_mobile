import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
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
  final bool fullPage;
  OpenProject({Key? key, this.fromHome = false, this.fullPage = true})
      : super(key: key);

  @override
  _OpenProjectState createState() => _OpenProjectState();
}

class _OpenProjectState extends State<OpenProject> {
  List<FileSystemEntity> _folders =
      List<FileSystemEntity>.empty(growable: true);
  int index = 0;

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
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      String path = result.files.single.path.toString();
      File file = File(path);
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
    } else {
      setState(() {
        index = 0;
      });
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fullPage) {
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
                      initialIndex: index,
                      buttons: ["GBlox", "Phone"],
                      functionList: [
                        () {},
                        () {
                          getInteralDir();
                        }
                      ],
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
                                  onLongPress: () async {
                                    File file = File(await e.path);
                                    print(
                                        "file at ${_folders.indexWhere((element) => element.path == e.path)}");
                                    file.delete();
                                    setState(() {
                                      _folders.removeAt(_folders.indexWhere(
                                          (element) => element.path == e.path));
                                    });
                                  },
                                  pressed: () async {
                                    File file = File(await e.path);
                                    String rawData = await file.readAsString();
                                    List<String> saveData =
                                        rawData.split(";\n");
                                    String xml = saveData[0].split("xml: ")[1];
                                    String device =
                                        saveData[1].split(" device: ")[1];
                                    global.selectedDevice = device;
                                    String variables =
                                        "[int sample_var, sample_var]";
                                    if (saveData.length > 2) {
                                      variables =
                                          saveData[2].split(" variables: ")[1];
                                    }
                                    if (widget.fromHome) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Blockly(
                                                  initialXML: xml,
                                                  variables: variables,
                                                )),
                                      );
                                    } else {
                                      Navigator.pop(context, [xml, variables]);
                                    }
                                  }));
                        }).toList()))
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
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
                        onLongPress: () async {
                          File file = File(await e.path);
                          print(
                              "file at ${_folders.indexWhere((element) => element.path == e.path)}");
                          file.delete();
                          setState(() {
                            _folders.removeAt(_folders.indexWhere(
                                (element) => element.path == e.path));
                          });
                        },
                        pressed: () async {
                          File file = File(await e.path);
                          String rawData = await file.readAsString();
                          List<String> saveData = rawData.split(";\n");
                          String xml = saveData[0].split("xml: ")[1];
                          String device = saveData[1].split(" device: ")[1];
                          global.selectedDevice = device;
                          String variables = "[int sample_var, sample_var]";
                          if (saveData.length > 2) {
                            variables = saveData[2].split(" variables: ")[1];
                          }
                          if (widget.fromHome) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Blockly(
                                        initialXML: xml,
                                        variables: variables,
                                      )),
                            );
                          } else {
                            Navigator.pop(context, [xml, variables]);
                          }
                        }));
              }).toList()));
    }
  }
}

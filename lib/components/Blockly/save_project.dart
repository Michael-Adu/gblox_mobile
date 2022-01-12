import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'dart:io';
import 'dart:math' as math;
import 'dart:convert';
import '../Modular_Widgets/Selector/selector_buttons.dart';
import '../global_variables.dart' as global;
import '../svgs/svgs.dart' as svgs;

class SaveProject extends StatefulWidget {
  @required
  late global.SaveInformation? saveData;
  @required
  late bool saveAs;

  SaveProject({
    Key? key,
    this.saveData,
    this.saveAs = false,
  }) : super(key: key);

  @override
  _SaveProjectState createState() => _SaveProjectState();
}

class _SaveProjectState extends State<SaveProject> {
  late global.SaveInformation saveData =
      global.SaveInformation("", "", "", "", "", false);
  late String saveName;
  late String globalFileName;
  late String globalFilePath;
  bool globalSaveAs = false;
  bool internalSave = true;
  var isSaved = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    globalSaveAs = widget.saveAs;
    saveData = widget.saveData!;
  }

  Future<global.SaveInformation> createFile(
      bool saveAs, String fileName, String filePath) async {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    String _appDocDirfile = '${_appDocDir.path}/GBlox/${fileName}.gbx';
    File file = File(await _appDocDirfile);
    if (await file.exists()) {
      print(await file.readAsString());
      file.delete();
      file.create();
      print(saveData.xml.toString());
      var data =
          "xml: ${saveData.xml};\ndevice: ${saveData.device};\nvariables: ${saveData.variables}";
      file.writeAsString(data.toString());
      return global.SaveInformation(saveData.xml, saveData.device,
          saveData.variables, fileName, _appDocDir.path, true);
    } else {
      file.create();
      print(saveData.xml.toString());
      var data =
          "xml: ${saveData.xml};\ndevice: ${saveData.device};\n variables: ${saveData.variables}";
      print(data);
      file.writeAsString(data.toString());
      return global.SaveInformation(saveData.xml, saveData.device,
          saveData.variables, fileName, _appDocDir.path, true);
    }
  }

  Future<global.SaveInformation> saveFileToStorage(String fileName) async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory == null) {
      return global.SaveInformation(saveData.xml, saveData.device,
          saveData.variables, fileName, saveData.filepath, true);
    } else {
      String _appDocDirfile = "${selectedDirectory}/${fileName}.gbx";
      File file = File(await _appDocDirfile);
      print(file);
      if (await file.exists()) {
        print(await file.readAsString());
        file.delete();
        file.create();
        print(saveData.xml.toString());
        var data =
            "xml: ${saveData.xml};\ndevice: ${saveData.device};\nvariables: ${saveData.variables}";
        file.writeAsString(data.toString());
        return global.SaveInformation(saveData.xml, saveData.device,
            saveData.variables, fileName, _appDocDirfile, true);
      } else {
        file.create();
        print(saveData.xml.toString());
        var data =
            "xml: ${saveData.xml};\ndevice: ${saveData.device};\n variables: ${saveData.variables}";
        print(data);
        file.writeAsString(data.toString());
        return global.SaveInformation(saveData.xml, saveData.device,
            saveData.variables, fileName, _appDocDirfile, true);
      }
    }
  }

  Future<global.SaveInformation> saveFile(
      bool saveAs, String fileName, String filePath) async {
    global.displayToast(saveData.filepath);
    File file = File(filePath);
    file.create();
    print(saveData.xml.toString());
    var data =
        "xml: ${saveData.xml};\ndevice: ${saveData.device};\nvariables: ${saveData.variables}";
    file.writeAsString(data.toString());
    return global.SaveInformation(saveData.xml, saveData.device,
        saveData.variables, fileName, filePath, true);
  }

  @override
  Widget build(BuildContext context) {
    if (globalSaveAs) {
    } else {
      saveFile(globalSaveAs, saveData.filename, saveData.filepath)
          .then((value) {
        Navigator.pop(context, value);
      });
    }
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Save As").tr(),
              centerTitle: true,
            ),
            body: Container(
                child: Row(
              children: [
                Container(
                  width: global.device_width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(global.device_height * 0.005))),
                        child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9a-zA-Z]")),
                            ],
                            onChanged: (textName) {
                              saveName = textName;
                            },
                            onSubmitted: (textName) {
                              saveName = textName;
                            },
                            style: TextStyle(
                              color: Color(0xff0000DC),
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'myCode',
                              fillColor: Colors.white,
                            )),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: global.device_width * (0.7 / 2.5),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      textStyle: TextStyle(
                                        fontSize: global.device_height * 0.04,
                                      )),
                                  onPressed: () {
                                    Navigator.pop(context, 'Canceled');
                                  },
                                  child: Text("Cancel")),
                            ),
                            Container(
                                width: global.device_width * (0.7 / 2.5),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize: global.device_height * 0.04,
                                        )),
                                    onPressed: () async {
                                      if (internalSave) {
                                        createFile(widget.saveAs, saveName, "")
                                            .then((value) {
                                          var data = value;
                                          Navigator.pop(context, value);
                                        });
                                      } else {
                                        saveFileToStorage(saveName)
                                            .then((value) {
                                          var data = value;
                                          Navigator.pop(context, value);
                                        });
                                        ;
                                      }
                                    },
                                    child: Text("Save")))
                          ])
                    ],
                  ),
                ),
                Container(
                    width: global.device_width * 0.3,
                    child: SelectorButtons(
                      buttons: ["Save Internally", "Save to Phone"],
                      functionList: [
                        () {
                          setState(() {
                            internalSave = true;
                          });
                        },
                        () {
                          setState(() {
                            internalSave = false;
                          });
                        }
                      ],
                    ))
              ],
            ))));
  }
}

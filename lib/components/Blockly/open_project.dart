import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share/share.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
  late String globalFileName;
  late String globalFilePath;
  Widget _fileDialog = Container();

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
      String rawData = await file.readAsString();
      final fileName =
          path.split(".gbx")[0].split("picker/")[1].toString() + ".gbx";
      List<String> saveData = rawData.split(";\n");
      String xml = saveData[0].split("xml: ")[1];
      String device = saveData[1].split("device: ")[1];
      global.selectedDevice = device;
      String variables = "[int sample_var, sample_var]";
      if (saveData.length > 2) {
        variables = saveData[2].split("variables: ")[1];
      }
      global.SaveInformation allData =
          global.SaveInformation(xml, device, variables, fileName, path, true);
      if (widget.fromHome) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Blockly(
                    initialXML: allData.xml,
                    variables: allData.variables,
                    fileName: allData.filename,
                    filePath: allData.filepath,
                    initialDevice: allData.device,
                    internalStorage: allData.internal,
                  )),
        );
      } else {
        Navigator.pop(context, allData);
      }
    } else {
      setState(() {
        index = 0;
      });
      // User canceled the picker
    }
  }

  void showFileDialog(File file, BuildContext context) {
    AwesomeDialog(
        context: context,
        width: global.device_size.width * 0.7,
        padding: EdgeInsets.all(global.device_size.height * 0.1),
        dialogType: DialogType.NO_HEADER,
        title: "Thats a cool file! What do you want to do with it?",
        body: Row(children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                alignment: Alignment.center,
                child: Text('''Thats a cool project you got there! 
What do you wanna do with it?''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: global.device_size.height * 0.04,
                        color: const Color(0xff0000DC)))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: global.device_size.height * 0.04,
                            color: Colors.red)),
                    onPressed: () {
                      file.delete();
                      setState(() {
                        _folders.removeAt(_folders.indexWhere(
                            (element) => element.path == file.path));
                        AwesomeDialog(context: context).dismiss();
                      });
                    },
                    child: Text("Delete this File",
                        style: TextStyle(
                            fontSize: global.device_size.height * 0.04,
                            color: Colors.red))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: global.device_size.height * 0.04,
                            color: Colors.green)),
                    onPressed: () {
                      Share.shareFiles(['${file.path}'],
                          text: 'Check out my gBlox Mobile Code!');
                    },
                    child: Text("Share this File",
                        style: TextStyle(
                            fontSize: global.device_size.height * 0.04,
                            color: Colors.green)))
              ],
            )
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.file_copy),
              Container(
                  alignment: Alignment.center,
                  width: global.device_size.width * 0.15,
                  child: Text(
                      file.path.split(".gbx")[0].split("GBlox/")[1] + ".gbx"))
            ],
          )
        ])).show();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fullPage) {
      return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Open',
                    style: TextStyle(fontSize: global.deviceText.title))
                .tr(),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context,
                      global.SaveInformation("", "", "", "", "", false));
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Container(
              child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: global.device_size.width * 0.3,
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
                    width: global.device_size.width * 0.7,
                    decoration: BoxDecoration(color: const Color(0xff0B0533)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _folders.map((e) {
                          List<String> pathName = e.toString().split("/");
                          String fileName = pathName.last.replaceAll("'", '');
                          return Container(
                              width: global.device_size.width * 0.5,
                              child: GBloxButtons(
                                  buttonType: "fileButtons",
                                  buttonName: fileName,
                                  onLongPress: () async {
                                    File file = File(await e.path);
                                    showFileDialog(file, context);
                                  },
                                  pressed: () async {
                                    File file = File(await e.path);
                                    String rawData = await file.readAsString();
                                    List<String> saveData =
                                        rawData.split(";\n");
                                    String xml = saveData[0].split("xml: ")[1];
                                    String device =
                                        saveData[1].split("device: ")[1];
                                    global.selectedDevice = device;
                                    String variables =
                                        "[int sample_var, sample_var]";
                                    if (saveData.length > 2) {
                                      variables =
                                          saveData[2].split("variables: ")[1];
                                    }
                                    global.SaveInformation allData =
                                        global.SaveInformation(xml, device,
                                            variables, fileName, e.path, true);
                                    if (widget.fromHome) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Blockly(
                                                  initialXML: allData.xml,
                                                  variables: allData.variables,
                                                  fileName: allData.filename,
                                                  filePath: allData.filepath,
                                                  initialDevice: allData.device,
                                                  internalStorage:
                                                      allData.internal,
                                                )),
                                      );
                                    } else {
                                      Navigator.pop(context, allData);
                                    }
                                  }));
                        }).toList()))
              ],
            ),
            _fileDialog
          ])),
        ),
      );
    } else {
      return Container(
          decoration: BoxDecoration(color: const Color(0xff0B0533)),
          child: Stack(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _folders.map((e) {
                  List<String> pathName = e.toString().split("/");
                  String fileName = pathName.last.replaceAll("'", '');
                  return Container(
                      width: global.device_size.width * 0.5,
                      child: GBloxButtons(
                          buttonType: "fileButtons",
                          buttonName: fileName,
                          onLongPress: () async {
                            File file = File(await e.path);
                            showFileDialog(file, context);
                          },
                          pressed: () async {
                            File file = File(await e.path);
                            String rawData = await file.readAsString();
                            List<String> saveData = rawData.split(";\n");
                            String xml = saveData[0].split("xml: ")[1];
                            String device = saveData[1].split("device: ")[1];
                            global.selectedDevice = device;
                            String variables = "[int sample_var, sample_var]";
                            if (saveData.length > 2) {
                              variables = saveData[2].split("variables: ")[1];
                            }
                            global.SaveInformation allData =
                                global.SaveInformation(xml, device, variables,
                                    fileName, e.path, true);
                            if (widget.fromHome) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Blockly(
                                          initialXML: allData.xml,
                                          variables: allData.variables,
                                          fileName: allData.filename,
                                          filePath: allData.filepath,
                                          initialDevice: allData.device,
                                          internalStorage: allData.internal,
                                        )),
                              );
                            } else {
                              Navigator.pop(context, allData);
                            }
                          }));
                }).toList()),
            _fileDialog
          ]));
    }
  }
}

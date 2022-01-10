import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import 'dart:math' as math;
import 'dart:convert';
import '../global_variables.dart' as global;
import '../svgs/svgs.dart' as svgs;

class SaveProject extends StatefulWidget {
  @required
  late String? saveData;
  SaveProject({Key? key, this.saveData}) : super(key: key);

  @override
  _SaveProjectState createState() => _SaveProjectState();
}

class _SaveProjectState extends State<SaveProject> {
  late String data;
  late String saveName;

  @override
  void initState() {
    super.initState();
    data = widget.saveData!;
  }

  Future<String> createFile(String fileName) async {
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    String _appDocDirfile = '${_appDocDir.path}/GBlox/${fileName}.gbx';
    File file = File(await _appDocDirfile);
    if (await file.exists()) {
      print(await file.readAsString());
      file.delete();
      file.create();
      file.writeAsString(data);
      return "File rewritten successfully";
    } else {
      file.create();
      file.writeAsString(data);
      return "File saved successfully";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Save As").tr(),
              centerTitle: true,
            ),
            body: Container(
                child: AlertDialog(
              content: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ],
                  onChanged: (textName) {
                    saveName = textName;
                  },
                  onSubmitted: (textName) {
                    saveName = textName;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'myCode',
                  )),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'Canceled');
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () async {
                      createFile(saveName).then((value) {
                        Navigator.pop(context, 'Saved');
                      });
                    },
                    child: Text("Save"))
              ],
            ))));
  }
}

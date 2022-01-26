# SaveProject

<aside>
💡 Saves .gbx files to be containing [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md) data.

</aside>

![Untitled](SaveProject%201bbbefafa25f4cc2be4f737680457841/Untitled.png)

# Packages used:

1. Path Provider
    
    [path_provider | Flutter Package](https://pub.dev/packages/path_provider)
    
2. File Picker
    
    [file_picker | Flutter Package](https://pub.dev/packages/file_picker)
    
3. Awesome Dialog
    
    [awesome_dialog | Flutter Package](https://pub.dev/packages/awesome_dialog)
    

# Modular Widgets used:

1. *Button [Modular Widgets](Modular%20Widgets%2072c25ed16f334935a10e40f350c66396.md)  - `gblox_mobile\lib\components\Modular_Widgets\Button`*
2. SelectorButtons  [Modular Widgets](Modular%20Widgets%2072c25ed16f334935a10e40f350c66396.md) - *`gblox_mobile\lib\components\Modular_Widgets\SelectorButtons`*

# Pages Used:

1. [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md) - `*gblox_mobile\lib\components\Blockly\blockly.dart*`

# Saving Files

- `class SaveProject` receives `global.SaveInformation` from [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md)  containing:
    1. xml data
    2. variable data
    3. device data
- It also receives a `boolean` variable indicating if this process is Save As or just Save.

## Save As

### Internal

- A `TextField` is shown for the user to name the file. If the field is not empty, the Save button will use the `createFile` function to save the file with the data in the internal directory.
    
    ```dart
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
    ```
    

```dart
TextField(
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
                              border: InputBorder.none,
                              hintText: 'myCode',
                              fillColor: Colors.white,
                            )),
```

```dart
ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        textStyle: TextStyle(
                                          fontSize:
                                              global.device_size.height * 0.04,
                                        )),
                                    onPressed: () async {
                                      if (saveName.length > 0) {
                                        if (internalSave) {
                                          createFile(
                                                  widget.saveAs, saveName, "")
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
                                      } else {}
                                    },
                                    child: Text("Save"))
```

### External

- If the user selects the Save to Phone option, the file will be saved to a directory picked by the user.

```dart
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
```

## Save Existing File

- If the user selected a normal save, then the file is overwritten. This uses the `saveFile` function as shown below.

```dart
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
```
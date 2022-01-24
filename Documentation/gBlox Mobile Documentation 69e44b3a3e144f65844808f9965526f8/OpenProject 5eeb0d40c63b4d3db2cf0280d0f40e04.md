# OpenProject

<aside>
💡 Opens .gbx files to be returned to [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md)

</aside>

![Untitled](OpenProject%205eeb0d40c63b4d3db2cf0280d0f40e04/Untitled.png)

# Packages used:

1. Path Provider
    
    [path_provider | Flutter Package](https://pub.dev/packages/path_provider)
    
2. File Picker
    
    [file_picker | Flutter Package](https://pub.dev/packages/file_picker)
    
3. Awesome Dialog
    
    [awesome_dialog | Flutter Package](https://pub.dev/packages/awesome_dialog)
    
4.  share
    
    [share | Flutter Package](https://pub.dev/packages/share)
    

# Modular Widgets used:

1. *Button [Modular Widgets](Modular%20Widgets%2072c25ed16f334935a10e40f350c66396.md)  - `gblox_mobile\lib\components\Modular_Widgets\Button`*
2. SelectorButtons  [Modular Widgets](Modular%20Widgets%2072c25ed16f334935a10e40f350c66396.md) - *`gblox_mobile\lib\components\Modular_Widgets\SelectorButtons`*

# Pages Used:

1. [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md) - `*gblox_mobile\lib\components\Blockly\blockly.dart*`

# Displaying Files

## Internal Application Documents

- Using dart.io, an empty growable list of `FileSystemEntities` called `_files` is filled with the files in the Applications document folder.
    
    ```dart
    List<FileSystemEntity> _files = List<FileSystemEntity>.empty(growable: true);
    
    void initState() {
        super.initState();
        var gbloxFolder = createFolderInAppDocDir("GBlox");
        getDir("GBlox");
      }
    ```
    
- If the application is freshly installed, a new folder called `GBlox` is created to store all the `.gbx` files saved internally using the `createFolderInAppDocDir` function below.
    
    ```dart
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
    ```
    

 

- When the folder is created, `getDir` is called to retrieve all the `.gbx` files and `setState` them to the empty `_files`.
    
    ```dart
    Future<void> getDir(String folderName) async {
        final directory = await getApplicationDocumentsDirectory();
        final dir = directory.path;
        String gBloxDirectory = '$dir/$folderName';
        final myDir = Directory(gBloxDirectory);
        try {
          setState(() {
            _files = myDir.listSync(recursive: true, followLinks: false);
          });
          print(_files);
        } catch (e) {}
      }
    ```
    
- The files are displayed in a column shown below.
    
    ```dart
    Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _files.map((e) {
                                  List<String> pathName = e.toString().split("/");
                                  String fileName =
                                      pathName.last.replaceAll("'", '');
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
                                            String rawData =
                                                await file.readAsString();
                                            List<String> saveData =
                                                rawData.split(";\n");
                                            String xml =
                                                saveData[0].split("xml: ")[1];
                                            String device =
                                                saveData[1].split("device: ")[1];
                                            global.selectedDevice = device;
                                            String variables =
                                                "[int sample_var, sample_var]";
                                            if (saveData.length > 2) {
                                              variables = saveData[2]
                                                  .split("variables: ")[1];
                                            }
                                            global.SaveInformation allData =
                                                global.SaveInformation(
                                                    xml,
                                                    device,
                                                    variables,
                                                    fileName,
                                                    e.path,
                                                    true);
                                            if (widget.fromHome) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Blockly(
                                                          initialXML: allData.xml,
                                                          variables:
                                                              allData.variables,
                                                          fileName:
                                                              allData.filename,
                                                          filePath:
                                                              allData.filepath,
                                                          initialDevice:
                                                              allData.device,
                                                          internalStorage:
                                                              allData.internal,
                                                        )),
                                              );
                                            } else {
                                              Navigator.pop(context, allData);
                                            }
                                          }));
                                }).toList())
    ```
    

## External Documents

- Files not found in the internal application directory are displayed differently. Rather than creating a custom display, the user is shown a file picker using the devices native file explorer.
- The file is read and the data is extracted and sent back to [Blockly](Blockly%200a30f6dea44a4764977494fb751bfbbe.md).

```dart
Future<void> getExternalDir() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      try {
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
        global.SaveInformation allData = global.SaveInformation(
            xml, device, variables, fileName, path, true);
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
      } catch (e) {
        global.displayToast("This file could not be opened");
      }
    } else {
      setState(() {
        index = 0;
      });
      // User canceled the picker
    }
  }
```

# Sharing and Deleting Files

![Untitled](OpenProject%205eeb0d40c63b4d3db2cf0280d0f40e04/Untitled%201.png)

- Upon long-pressing a file, the user is shown an alert dialog using the Awesome Dialog package.
- The user can then choose to either delete the file, or share it using the share package.

```dart
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
                        _files.removeAt(_files.indexWhere(
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
```
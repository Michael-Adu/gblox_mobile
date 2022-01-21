import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animations/animations.dart';
import 'package:share/share.dart';
import '../Modular_Widgets/ToolboxButtons/toolbox_category_buttons.dart';
import '../Modular_Widgets/Button/buttons.dart';
import '../Modular_Widgets/Cards/cards.dart';
import 'open_project.dart';
import 'save_project.dart';
import '../global_variables.dart' as global;
import '../svgs/svgs.dart' as svgs;
import 'dart:math' as math;

//Creates the blockly page containing Flutter buttons on load.
class Blockly extends StatefulWidget {
  final String initialXML;
  final String initialDevice;
  final String variables;
  final String fileName;
  final String filePath;
  final bool internalStorage;

  Blockly(
      {Key? key,
      this.initialXML = "",
      this.variables = "",
      this.fileName = "",
      this.filePath = "",
      this.initialDevice = "",
      this.internalStorage = true})
      : super(key: key);
  @override
  _BlocklyState createState() => _BlocklyState();
}

class _ToolboxClass {
  String name;
  bool category;
  int index;
  String click;
  _ToolboxClass(this.name, this.category, this.index, this.click);
}

class _ToolboxCategoryClass {
  String name;
  int index;
  bool category;
  List<global.ToolboxClass> children;
  String click;

  _ToolboxCategoryClass(
      this.name, this.index, this.category, this.children, this.click);
}

class _DeviceProfile {
  Color color;
  String svg;

  _DeviceProfile(this.svg, this.color);
}

class _BlocklyState extends State<Blockly> {
  late InAppWebViewController? controller;
  late List<List<String>> toolbox = List<List<String>>.empty(growable: true);
  var loaded = ValueNotifier<bool>(false);
  bool deviceDrawerOpen = false;
  late List<Widget> widgetToolbox = List<Widget>.empty(growable: true);
  late List<_ToolboxCategoryClass> renderedToolboxCategories =
      List<_ToolboxCategoryClass>.empty(growable: true);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  global.SaveInformation saveinfo =
      global.SaveInformation("", "", "", "", "", false);
  var currentXml = ValueNotifier<String>("");
  String variables = "[int sample_var, sample_var]";
  late String categoryName;
  late int categoryIndex;
  late int categoryNumber = 0;
  bool category = false;

  @override
  void initState() {
    super.initState();
    if (widget.fileName.length > 1) {
      saveinfo = global.SaveInformation(
          widget.initialXML,
          widget.initialDevice,
          widget.variables,
          widget.fileName,
          widget.filePath,
          widget.internalStorage);
    }
  }

  void updateToolbox() {
    widgetToolbox.clear(); //clear widgetToolbox
    renderedToolboxCategories.clear(); //clear the toolboxCategories
    late List<global.ToolboxClass> categoryChildren =
        List<global.ToolboxClass>.empty(growable: true);
    for (int i = 0; i < toolbox.length; i++) {
      if (category) {
        if (i - categoryNumber < categoryIndex) {
          categoryChildren
              .add(global.ToolboxClass(toolbox[i][0], false, i, toolbox[i][1]));
        } else {
          categoryChildren
              .add(global.ToolboxClass(toolbox[i][0], false, i, toolbox[i][1]));
          setState(() {
            renderedToolboxCategories.add(_ToolboxCategoryClass(
                categoryName, categoryIndex, true, categoryChildren, ""));
          });
          categoryChildren = List<global.ToolboxClass>.empty(growable: true);
          category = false;
        }
      } else {
        if (toolbox[i][2] == "category") {
          setState(() {
            category = true;
            categoryName = toolbox[i][0];
            categoryIndex = i;
            categoryNumber = int.parse(toolbox[i][3]);
          });
        } else {
          setState(() {
            renderedToolboxCategories.add(_ToolboxCategoryClass(
                toolbox[i][0], i, false, categoryChildren, toolbox[i][1]));
          });
        }
      }
    }
    var categoryButtons = renderedToolboxCategories.map((e) {
      return ToolboxCategoryButtons(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          name: e.name,
          categoryChildren: e.children,
          category: e.category,
          pressed: () {
            controller!.evaluateJavascript(source: '''
                document.getElementById("${e.click}").click();
                ''');
          });
    }).toList();

    widgetToolbox = categoryButtons;
    loaded.value = true;
    if (widget.variables.isNotEmpty) {
      variables = widget.variables;
      controller!.evaluateJavascript(
          source: '''loadBlocklyVariables("${variables}")''');
    }
    if (widget.initialXML.contains("xml")) {
      currentXml.value = widget.initialXML.toString();
      controller!.evaluateJavascript(source: '''
        var xml = window.mainBlockly.Xml.textToDom('${currentXml.value}');
        window.mainBlockly.Xml.clearWorkspaceAndLoadFromXml(xml,window.currentWorkspace)
    ''').then((response) {
        controller!.evaluateJavascript(source: '''
                                  var xml = window.mainBlockly.Xml.textToDom('${currentXml.value}');
                                  window.mainBlockly.Xml.clearWorkspaceAndLoadFromXml(xml,window.currentWorkspace)
                          ''');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget deviceSelector = Container(
        alignment: Alignment.centerRight,
        width: global.device_size.width * 0.6275,
        color: Color(0xff0B0533),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: global.cardSize * 0.7,
              child: GBloxCards(
                svg: svgs.mingo,
                pressed: () {
                  global.selectedDevice = "Mingo";
                  global.webController!.evaluateJavascript(source: '''
                document.getElementById("${global.selectedDevice}").click();
                ''');
                  setState(() {
                    deviceDrawerOpen = false;
                  });
                },
                text: "Mingo",
                textBackgroundColor: Color(0xff8D00E8),
                compressSVG: false,
              ),
            ),
            Container(
              height: global.cardSize * 0.7,
              child: GBloxCards(
                svg: svgs.mello,
                pressed: () {
                  global.selectedDevice = "Mello";
                  global.webController!.evaluateJavascript(source: '''
                document.getElementById("${global.selectedDevice}").click();
                ''');
                  setState(() {
                    deviceDrawerOpen = false;
                  });
                },
                text: "Mello",
                textBackgroundColor: Color(0xff40BF4A),
                compressSVG: false,
              ),
            )
          ],
        ));
    _DeviceProfile device = _DeviceProfile(svgs.mingo, Color(0xff8100FF));
    if (global.selectedDevice == "Mingo") {
      device = _DeviceProfile(svgs.mingo, Color(0xff8100FF));
    } else if (global.selectedDevice == "Mello") {
      device = _DeviceProfile(svgs.mello, Colors.green);
    }

    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            key: _scaffoldKey,
            onDrawerChanged: (status) {
              if (status == false) {
                setState(() {
                  deviceDrawerOpen = false;
                });
              }
            },
            appBar: AppBar(
              title: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu, color: Colors.white));
                  }),
                  Expanded(
                    child: Center(
                        child: Text('code_mode',
                                style: TextStyle(
                                    fontSize: global.deviceText.title))
                            .tr()),
                  )
                ],
              )),
              actions: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    );
                  },
                )
              ],
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            drawer: Container(
              child: Row(children: [
                Drawer(
                    child: Container(
                  color: Theme.of(global.navigatorKey.currentContext!)
                      .colorScheme
                      .primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          height: global.device_size.height * 0.05,
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close,
                                  color: Colors.white, size: 20))),
                      Container(
                          width: 20,
                          padding: const EdgeInsets.fromLTRB(110, 0, 110, 30),
                          child: Container(
                            child: CircleAvatar(
                              child: Stack(children: [
                                Align(
                                  child:
                                      SvgPicture.string(device.svg, width: 60),
                                  alignment: Alignment.center,
                                ),
                                InkWell(
                                    onTap: () {
                                      if (deviceDrawerOpen) {
                                        setState(() {
                                          deviceDrawerOpen = false;
                                        });
                                      } else {
                                        setState(() {
                                          deviceDrawerOpen = true;
                                        });
                                      }
                                    },
                                    child: const Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.white70,
                                        child: Icon(Icons.add),
                                      ),
                                    )),
                              ]),
                              backgroundColor: device.color,
                              radius: 40,
                            ),
                          )),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "New",
                        pressed: () {
                          controller!.evaluateJavascript(source: '''
                          currentWorkspace.clear()
                          ''');
                          setState(() {
                            saveinfo = global.SaveInformation(
                                "", "", "", "", "", false);
                          });
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Open",
                        pressed: () async {
                          var data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OpenProject(
                                        fromHome: false,
                                      )));
                          try {
                            setState(() {
                              saveinfo = data;
                            });
                            global.selectedDevice = saveinfo.device;
                            variables = saveinfo.variables.toString();
                            currentXml.value = saveinfo.xml.toString();
                            controller!.evaluateJavascript(
                                source:
                                    '''loadBlocklyVariables("${variables}")''');
                            controller!.evaluateJavascript(source: '''
                                  var xml = window.mainBlockly.Xml.textToDom('${currentXml.value}');
                                  window.mainBlockly.Xml.clearWorkspaceAndLoadFromXml(xml,window.currentWorkspace)
                          ''').then((response) {
                              controller!.evaluateJavascript(source: '''
                                  var xml = window.mainBlockly.Xml.textToDom('${currentXml.value}');
                                  window.mainBlockly.Xml.clearWorkspaceAndLoadFromXml(xml,window.currentWorkspace)
                          ''');
                            });
                          } catch (e) {}
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Save",
                        pressed: () async {
                          await controller!.evaluateJavascript(source: '''
                          console.log("xml: " + window.mainBlockly.Xml.domToText(window.mainBlockly.Xml.workspaceToDom(window.currentWorkspace)))
                          ''').then((value) async {
                            if (saveinfo.filename.isEmpty) {
                              saveinfo = global.SaveInformation(
                                  currentXml.value,
                                  global.selectedDevice,
                                  variables,
                                  "",
                                  "",
                                  false);
                              var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SaveProject(
                                          saveAs: true, saveData: saveinfo)));
                              setState(() {
                                saveinfo = data;
                              });
                            } else {
                              saveinfo.xml = currentXml.value;
                              saveinfo.variables = variables;
                              saveinfo.device = global.selectedDevice;
                              var data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SaveProject(
                                          saveAs: false, saveData: saveinfo)));
                              setState(() {
                                saveinfo = data;
                              });
                            }
                          });
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Save as",
                        pressed: () async {
                          controller!.evaluateJavascript(source: '''
                          console.log("xml: " + window.mainBlockly.Xml.domToText(window.mainBlockly.Xml.workspaceToDom(window.currentWorkspace)))
                          ''').then((value) async {
                            var data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SaveProject(
                                        saveAs: true, saveData: saveinfo)));
                            setState(() {
                              saveinfo = data;
                            });
                          });
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Share",
                        pressed: () {
                          if (saveinfo.filepath.isNotEmpty) {
                            Share.shareFiles(['${saveinfo.filepath}'],
                                text: 'Check out my gBlox Mobile Code!');
                          } else {
                            global.displayToast(
                                "No file has been saved or loaded!");
                          }
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Exit",
                        pressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )),
                deviceDrawerOpen ? deviceSelector : Container()
              ]),
            ),
            endDrawer: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Drawer(
                  child: Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: ListView(padding: EdgeInsets.zero, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.file_copy,
                      color: Colors.white,
                    ),
                    Text(saveinfo.filename,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: global.device_size.height * 0.05))
                  ]),
                  ConfigurableExpansionTile(
                      animatedWidgetFollowingHeader: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_downward,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.04)),
                      header: Container(
                          width: MediaQuery.of(context).size.width * 0.255,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'change_language_settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04),
                          ).tr()),
                      borderColorEnd: Colors.lightGreen,
                      children: [
                        InkWell(
                            onTap: () {
                              context.setLocale(const Locale("en"));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.05),
                              child: Text(
                                "English",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.04),
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              context.setLocale(const Locale("fr"));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.05),
                              child: Text(
                                "Français",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.04),
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              context.setLocale(const Locale("pt"));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.05),
                              child: const Text(
                                "Português",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              context.setLocale(const Locale("de"));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.05),
                              child: const Text(
                                "Deutsch",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ]),
                  ListTile(
                      enableFeedback: true,
                      title: Text('help_settings',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.04))
                          .tr(),
                      onTap: () {})
                ]),
              )),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: global.device_size.width * 0.215,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: ValueListenableBuilder(
                                valueListenable: loaded,
                                builder: (context, value, widget) {
                                  if (loaded.value) {
                                    return SingleChildScrollView(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: widgetToolbox));
                                  } else {
                                    return Container();
                                  }
                                }),
                            height: global.device_size.height * 0.65,
                          ),
                          InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            onTap: () {
                              print(controller!.takeScreenshot(
                                  screenshotConfiguration:
                                      ScreenshotConfiguration()));
                            },
                            child: Container(
                                width: global.device_size.width * 0.15,
                                height: global.device_size.height * 0.1,
                                padding: const EdgeInsets.all(5),
                                child: const Icon(Icons.play_arrow,
                                    color: Colors.white),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.blue,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ])),
                Container(
                    width: global.device_size.width * 0.785,
                    alignment: Alignment.centerRight,
                    child: InAppWebView(
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true,
                            allowFileAccessFromFileURLs: true,
                            allowUniversalAccessFromFileURLs: true,
                          ),
                          android: AndroidInAppWebViewOptions(
                            useHybridComposition: true,
                            domStorageEnabled: true,
                          ),
                          ios: IOSInAppWebViewOptions(
                            allowsInlineMediaPlayback: true,
                          )),
                      initialFile: 'assets/react-blockly/index.html',
                      onWebViewCreated: (InAppWebViewController defcontroller) {
                        controller = defcontroller;
                        global.webController = controller!;
                      },
                      onLoadStop:
                          (InAppWebViewController controller, Uri? url) {
                        controller.evaluateJavascript(source: '''
                        document.getElementById("Mingo").click();
                        document.getElementById("${global.selectedDevice}").click();
                        document.getElementById("TrashTotal").style.display="none";
                        ''');
                      },
                      onConsoleMessage: (InAppWebViewController controller,
                          ConsoleMessage consoleMessage) async {
                        if (consoleMessage.message.contains("toolbox:")) {
                          var temp_toolbox_string = consoleMessage.message;
                          var temp_toolbox = temp_toolbox_string
                              .split("toolbox:")[1]
                              .split(",");
                          late List<List<String>> toolbox_list = [];
                          for (int i = 0; i < temp_toolbox.length; i++) {
                            if (temp_toolbox[i] == "category") {
                              var tt = temp_toolbox.sublist(i - 2, i + 2);
                              toolbox_list.add(tt);
                            } else if (temp_toolbox[i] == "non-category") {
                              var tt = temp_toolbox.sublist(i - 2, i + 1);
                              toolbox_list.add(tt);
                            }
                            toolbox = toolbox_list;
                            updateToolbox();
                          }

                          //temp_toolbox = temp_toolbox;
                        } else if (consoleMessage.message.contains("xml:")) {
                          var temp_xml_string = consoleMessage.message;
                          var temp_xml = temp_xml_string.split("xml: ")[1];
                          print(temp_xml);
                          currentXml.value = temp_xml;
                        } else if (consoleMessage.message
                            .contains("variables")) {
                          print(consoleMessage.message);
                          var temp_variables_string = consoleMessage.message;
                          var temp_variables =
                              temp_variables_string.split("variables:")[1];
                          print(temp_variables);
                          setState(() {
                            variables = "[$temp_variables]";
                          });
                        } else {
                          print(
                              "console message: ${consoleMessage.message.toString()}");
                        }
                      },
                    )),
              ],
            )));
  }
}

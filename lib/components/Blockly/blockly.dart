import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import '../Modular_Widgets/ToolboxButtons/toolbox_category_buttons.dart';
import '../Modular_Widgets/Button/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../global_variables.dart' as global;
import '../svgs/svgs.dart' as svgs;
import 'dart:math' as math;

//Creates the blockly page containing Flutter buttons on load.
class Blockly extends StatefulWidget {
  const Blockly({Key? key}) : super(key: key);
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

class _BlocklyState extends State<Blockly> {
  late InAppWebViewController? controller;
  late List<List<String>> toolbox = List<List<String>>.empty(growable: true);
  var loaded = ValueNotifier<bool>(false);
  late List<_ToolboxClass> renderedToolbox =
      List<_ToolboxClass>.empty(growable: true);
  late List<Widget> widgetToolbox = List<Widget>.empty(growable: true);
  late List<_ToolboxCategoryClass> renderedToolboxCategories =
      List<_ToolboxCategoryClass>.empty(growable: true);

  late String categoryName;
  late int categoryIndex;
  late int categoryNumber = 0;
  bool category = false;
  @override
  void initState() {
    super.initState();
    renderedToolbox.add(_ToolboxClass("None", true, 0, "blockly-0"));
  }

  List<_ToolboxClass> updateToolbox() {
    widgetToolbox.clear();
    renderedToolboxCategories.clear();
    renderedToolbox.clear();
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
    return renderedToolbox;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
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
                  const Expanded(
                    child: Center(child: Text('Code')),
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
              // leading: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //           onPressed: () {
              //             Navigator.pop(context);
              //           },
              //           icon: const Icon(Icons.home, color: Colors.white)),
              //       Builder(builder: (context) {
              //         return IconButton(
              //             onPressed: () {
              //               Scaffold.of(context).openDrawer();
              //             },
              //             icon: const Icon(Icons.menu, color: Colors.white));
              //       })
              //     ])
            ),
            drawer: Drawer(
              child: Container(
                  color: Theme.of(global.navigatorKey.currentContext!)
                      .colorScheme
                      .primary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close,
                                  color: Colors.white, size: 20))),
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: CircleAvatar(
                          child: SvgPicture.string(svgs.mingo, width: 60),
                          backgroundColor: const Color(0xff8100FF),
                          radius: 40,
                        ),
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "New",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Open",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Save",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Save as",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Share",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                      GBloxButtons(
                        buttonType: "menuButtons",
                        buttonName: "Exit",
                        pressed: () {
                          global.displayToast("This feature is not ready yet");
                        },
                      ),
                    ],
                  )),
            ),
            endDrawer: Drawer(
                child: Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    enableFeedback: true,
                    title: const Text('change_language_settings').tr(),
                    onTap: () {
                      {
                        if (global.navigatorKey.currentContext!.locale ==
                            const Locale("en")) {
                          global.navigatorKey.currentContext!
                              .setLocale(const Locale("fr"));
                        } else {
                          global.navigatorKey.currentContext!
                              .setLocale(const Locale("en"));
                        }
                      }
                    },
                  ),
                  ListTile(
                      enableFeedback: true,
                      title: const Text('help_settings').tr(),
                      onTap: () {})
                ],
              ),
            )),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: global.device_width * 0.215,
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
                            height: global.device_height * 0.65,
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
                                width: global.device_width * 0.15,
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
                    width: global.device_width * 0.785,
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
                        document.getElementById("Mello").click();
                        ''');
                      },
                      onConsoleMessage: (InAppWebViewController controller,
                          ConsoleMessage consoleMessage) {
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
                        } else {
                          print("console message: ${consoleMessage.message}");
                        }
                      },
                    )),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Modular_Widgets/ToolboxButtons/toolbox_buttons.dart';
import 'Modular_Widgets/ToolboxButtons/toolbox_category_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'global_variables.dart' as global;
import './svgs/g_blox_custom_s_v_gs_icons.dart';
import './svgs/svgs.dart' as svgs;
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
  _ToolboxClass(this.name, this.category, this.index);
}

class _ToolboxCategoryClass {
  String name;
  int index;
  bool category;
  List<_ToolboxClass> children;

  _ToolboxCategoryClass(this.name, this.index, this.category, this.children);
}

class _BlocklyState extends State<Blockly> {
  late InAppWebViewController? controller;
  late List<List<String>> toolbox;
  var loaded = ValueNotifier<bool>(false);
  late List<_ToolboxClass> renderedToolbox =
      List<_ToolboxClass>.empty(growable: true);
  late List<Widget> widgetToolbox = List<Widget>.empty(growable: true);
  late List<_ToolboxCategoryClass> renderedToolboxCategories =
      List<_ToolboxCategoryClass>.empty(growable: true);

  void initState() {
    super.initState();
    renderedToolbox.add(_ToolboxClass("None", true, 0));
  }

  List<_ToolboxClass> updateToolbox() {
    //widgetToolbox.clear();
    //renderedToolboxCategories.clear();
    renderedToolbox.clear();
    late List<_ToolboxClass> categoryChildren =
        List<_ToolboxClass>.empty(growable: true);

    late String categoryName;
    late int categoryIndex;
    bool category = false;

    for (int i = 0; i < toolbox.length; i++) {
      if (category = true) {
        if ((toolbox[i][2] == "category")) {
          category = false;
          setState(() {
            renderedToolboxCategories.add(_ToolboxCategoryClass(
                categoryName, categoryIndex, true, categoryChildren));
          });
          categoryChildren.clear();
        } else {
          setState(() {
            renderedToolbox.add(_ToolboxClass(toolbox[i][0], false, i));
          });
          categoryChildren.add(_ToolboxClass(toolbox[i][0], false, i));
        }
      } else {
        if (toolbox[i][2] == "category") {
          category = true;
          categoryName = toolbox[i][0];
          categoryIndex = i;
          setState(() {
            renderedToolbox.add(_ToolboxClass(toolbox[i][0], true, i));
          });
        } else {
          category = false;
          setState(() {
            renderedToolbox.add(_ToolboxClass(toolbox[i][0], false, i));
          });
        }
      }
    }
    print(renderedToolboxCategories);

    var normalbuttons = renderedToolbox.map((e) {
      return (ToolboxButtons(
        pressed: () {
          controller!.evaluateJavascript(source: '''
                clickOnToolbox(${e.index});
                ''');
          print(renderedToolboxCategories);
        },
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        name: e.name,
        category: e.category,
      ));
    }).toList();
    var categoryButtons = renderedToolboxCategories.map((e) {
      return ToolboxCategoryButtons(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
        name: e.name,
        categoryChildren: categoryChildren,
      );
    }).toList();

    widgetToolbox = normalbuttons;
    loaded.value = true;
    return renderedToolbox;
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: ToolboxButtons(
              pressed: () {
                controller!.evaluateJavascript(source: '''
                clickOnToolbox(${renderedToolbox[index].index});
                ''');
              },
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              name: renderedToolbox[index].name,
            )));
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
                padding: const EdgeInsets.all(20),
                color: Theme.of(global.navigatorKey.currentContext!)
                    .colorScheme
                    .primary,
                child: ListView(
                  children: [
                    CircleAvatar(
                      child: SvgPicture.string(svgs.mingo, width: 100),
                      backgroundColor: const Color(0xff8100FF),
                      radius: 70,
                    ),
                    ListTile(
                        title: Text("New"),
                        onTap: () {
                          global.displayToast("This is not ready yet!");
                        }),
                    ListTile(
                        title: Text("Open"),
                        onTap: () {
                          global.displayToast("This is not ready yet!");
                        }),
                    ListTile(
                        title: Text("Save"),
                        onTap: () {
                          global.displayToast("This is not ready yet!");
                        }),
                    ListTile(
                        title: Text("Save as"),
                        onTap: () {
                          global.displayToast("This is not ready yet!");
                        }),
                    ListTile(
                        title: Text("Share"),
                        onTap: () {
                          global.displayToast("This is not ready yet!");
                        }),
                    ListTile(title: Text("Exit"), onTap: () {}),
                  ],
                ),
              ),
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
                    title: const Text('change_theme_settings').tr(),
                    onTap: () {},
                  ),
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
                    width: 175,
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
                            height: 250,
                          ),
                          InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            onTap: () {
                              global.displayToast(
                                  "This feature is not ready yet");
                            },
                            child: Container(
                                width: 100,
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
                    width: 640,
                    alignment: Alignment.centerRight,
                    child: InAppWebView(
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true,
                            mediaPlaybackRequiresUserGesture: false,
                          ),
                          android: AndroidInAppWebViewOptions(
                            useHybridComposition: true,
                          ),
                          ios: IOSInAppWebViewOptions(
                            allowsInlineMediaPlayback: true,
                          )),
                      initialFile:
                          'assets/blockly/google-blockly-fc6a1be/demos/my_tests/index.html',
                      onWebViewCreated: (InAppWebViewController defcontroller) {
                        controller = defcontroller;
                        global.webController = controller!;
                        defcontroller.addJavaScriptHandler(
                            handlerName: "sendToFlutter",
                            callback: (args) {
                              print(args);
                            });
                        defcontroller.addJavaScriptHandler(
                            handlerName: "toolBoxReturn",
                            callback: (args) {
                              print(args);
                            });
                      },
                      onLoadStop:
                          (InAppWebViewController controller, Uri? url) {
                        controller.evaluateJavascript(source: '''
                          returnToolbox();
                        ''').then((value) {});
                      },
                      onConsoleMessage: (InAppWebViewController controller,
                          ConsoleMessage consoleMessage) {
                        if (consoleMessage.message.contains("toolbox:")) {
                          var temp_toolbox_string = consoleMessage.message;
                          var temp_toolbox = temp_toolbox_string
                              .split("toolbox:")[1]
                              .split(",");
                          print(temp_toolbox.length);
                          late List<List<String>> toolbox_list = [];
                          for (int i = 0; i < temp_toolbox.length; i++) {
                            if (temp_toolbox[i].contains("category")) {
                              var tt = temp_toolbox.sublist(i - 2, i + 1);
                              print(tt);
                              toolbox_list.add(tt);
                            }
                            toolbox = toolbox_list;
                            renderedToolbox = updateToolbox();
                          }

                          //temp_toolbox = temp_toolbox;
                        }

                        //print("console message: ${consoleMessage.message}");
                      },
                    )),
              ],
            )));
  }
}

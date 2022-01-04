import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import './components/global_variables.dart' as global;
import './components/svgs/svgs.dart' as svgs;
import './components/Modular_Widgets/Cards/cards.dart';

import 'components/Bluetooth/device_select.dart';
import './components/Menus/ModeSelector/mode_select.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(EasyLocalization(
        supportedLocales: [
          const Locale('en'),
          const Locale('fr'),
          const Locale('pt'),
          const Locale('de')
        ],
        path: 'assets/languages',
        fallbackLocale: const Locale('en'),
        child: const GbloxApp()));
  });
}

class GbloxApp extends StatefulWidget {
  const GbloxApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GbloxApp();
  }
}

class _CardDetails {
  String svg;
  String title;
  Color textBackgroundColor;
  Function? pressed;
  bool compressSVG;

  _CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed,
      this.compressSVG);
}

class _GbloxApp extends State<GbloxApp> {
  late List<_CardDetails> startCards = List<_CardDetails>.empty(growable: true);
  double _cardSize = 250;
  ThemeData _currentTheme = global.darkTheme;
  _GbloxApp();

  void initState() {
    super.initState();

    startCards.add(_CardDetails(svgs.playMode, "Select Mode", Colors.red, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ModeSelector()),
      );
    }, false));
    startCards.add(_CardDetails(svgs.mingo, "Select Device", Colors.orange, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DiscoveryPage()),
      );
    }, false));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: global.navigatorKey,
        theme: _currentTheme,
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                    title: const Text('applicationName').tr(),
                    centerTitle: true,
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                    actions: <Widget>[
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
                    ]),
                drawer: Drawer(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  color: Theme.of(context).colorScheme.background,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                          enableFeedback: true,
                          title: const Text('mode_select_page').tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ModeSelector()),
                            );
                          }),
                      ListTile(
                          enableFeedback: true,
                          title: const Text('device_select_drawer').tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiscoveryPage()),
                            );
                          }),
                    ],
                  ),
                )),
                endDrawer: Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: Drawer(
                      child: Container(
                    color: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: ListView(padding: EdgeInsets.zero, children: [
                      ListTile(
                        enableFeedback: true,
                        title: const Text('change_theme_settings').tr(),
                        onTap: () {
                          if (_currentTheme == global.darkTheme) {
                            setState(() {
                              _currentTheme = global.lightTheme;
                            });
                          } else {
                            setState(() {
                              _currentTheme = global.darkTheme;
                            });
                          }
                        },
                      ),
                      ConfigurableExpansionTile(
                          animatedWidgetFollowingHeader: Container(
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.arrow_downward,
                                  color: Colors.white, size: 10)),
                          header: Container(
                              width: MediaQuery.of(context).size.width * 0.255,
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'change_language_settings',
                                style: TextStyle(color: Colors.white),
                              ).tr()),
                          borderColorEnd: Colors.lightGreen,
                          children: [
                            InkWell(
                                onTap: () {
                                  context.setLocale(const Locale("en"));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  child: const Text(
                                    "English",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  context.setLocale(const Locale("fr"));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  child: const Text(
                                    "Français",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  context.setLocale(const Locale("pt"));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.05),
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
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  child: const Text(
                                    "Deutsch",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ]),
                      ListTile(
                          enableFeedback: true,
                          title: const Text('help_settings').tr(),
                          onTap: () {})
                    ]),
                  )),
                ),
                body: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: ((MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top) *
                            0.8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.6),
                                      child: GBloxCards(
                                          svg: svgs.playMode,
                                          text: "mode_select_page",
                                          textBackgroundColor: Colors.blue,
                                          pressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ModeSelector()),
                                            );
                                          }))),
                              Expanded(
                                  child: Container(
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.6),
                                      child: GBloxCards(
                                          svg: svgs.mingo,
                                          text: "select_device_page",
                                          textBackgroundColor: Colors.teal,
                                          pressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DiscoveryPage()),
                                            );
                                          }))),
                            ]))))));
  }
}

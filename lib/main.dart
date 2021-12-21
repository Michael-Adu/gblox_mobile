import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import './components/global_variables.dart' as global;
import './components/svgs/svgs.dart' as svgs;
import './components/Modular_Widgets/Cards/cards.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        supportedLocales: [const Locale('en'), const Locale('fr')],
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
  int _focusedIndex = 0;
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

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
        width: _cardSize,
        height: 400,
        child: Container(
            child: GBloxCards(
                svg: startCards[index].svg,
                text: startCards[index].title,
                textBackgroundColor: startCards[index].textBackgroundColor,
                pressed: startCards[index].pressed)));
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
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
                      ListTile(
                        enableFeedback: true,
                        title: const Text('change_language_settings').tr(),
                        onTap: () {
                          {
                            if (context.locale == const Locale("en")) {
                              context.setLocale(const Locale("fr"));
                            } else {
                              context.setLocale(const Locale("en"));
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
                body: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Container(
                          width: _cardSize,
                          height: _cardSize,
                          child: GBloxCards(
                              svg: svgs.playMode,
                              text: "mode_select_page",
                              textBackgroundColor: Colors.blue,
                              pressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ModeSelector()),
                                );
                              })),
                      Container(
                          width: _cardSize,
                          height: _cardSize,
                          child: GBloxCards(
                              svg: svgs.mingo,
                              text: "select_device_page",
                              textBackgroundColor: Colors.teal,
                              pressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiscoveryPage()),
                                );
                              })),
                    ])))));
  }
}

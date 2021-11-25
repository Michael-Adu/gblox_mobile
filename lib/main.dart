import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:easy_localization/easy_localization.dart';
import './components/blockly.dart';
import './components/controller.dart';
import './components/piano.dart';
import './components/recent_projects.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './components/device_select.dart';

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
        fallbackLocale: Locale('en'),
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

class _GbloxApp extends State<GbloxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff0B0533),
          cardTheme: const CardTheme(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          )),
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: "Baloo 2"),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.blue,
          ),
        ),
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                    title: const Text('applicationName').tr(),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
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
                            icon:
                                const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        },
                      )
                    ]),
                drawer: Drawer(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                  color: const Color(0xff0B0533),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        enableFeedback: true,
                        title: const Text('Blockly'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Blockly()),
                          );
                        },
                      ),
                      ListTile(
                        enableFeedback: true,
                        title: const Text('controller_drawer').tr(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Controller()),
                          );
                        },
                      ),
                      ListTile(
                          enableFeedback: true,
                          title: const Text('piano_drawer').tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PianoApp()),
                            );
                          }),
                      ListTile(
                          enableFeedback: true,
                          title: const Text('device_select_drawer').tr(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DiscoveryPage()),
                            );
                          })
                    ],
                  ),
                )),
                endDrawer: Drawer(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                  color: const Color(0xff0B0533),
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
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.string('''
                  <svg xmlns="http://www.w3.org/2000/svg" width="205" height="205" viewBox="0 0 205 205">
  <g id="Loading_Circle" data-name="Loading Circle" transform="translate(-805 -387)">
    <path id="Logo" d="M979.166-591.177c.661,1.763,1.4,4.188,1.69,5.289l.514,2.057-1.91-1.249c-1.543-1.028-2.277-1.1-3.747-.367-2.351,1.029-2.5,1.029-2.5-.294,0-2.13,3.086-9.256,3.894-8.963C977.623-594.556,978.5-592.94,979.166-591.177Zm-20.349,2.865c4.261,1.616,9.183,5.8,11.093,9.55,1.1,2.2,1.1,2.424-.661,5.51a24.818,24.818,0,0,1-4.261,5.142l-2.351,1.984-.808-3.306c-1.616-6.538-5.363-9.624-11.313-9.477a10.461,10.461,0,0,0-10.138,11.24c.588,6.465,5,10.212,12.122,10.212,9.991,0,19.247-6.685,23.361-16.676,1.543-3.967,1.616-3.967,1.91-1.69,1.029,6.832-3.085,17.044-8.816,22.039-5.143,4.628-9.183,6.171-16.162,6.465-9.55.441-15.868-2.865-20.349-10.505C922.378-574.941,940.009-595.291,958.816-588.312Zm-16.823,50.763c5.73,2.057,14.913,1.69,20.717-.808,4.555-1.91,5.069-1.69,7.567,3.673,2.057,4.408,2.277,4.187-6.244,7.053-9.55,3.159-19.321,2.718-29.532-1.322-4.628-1.763-4.775-2.571-1.69-7.493,1.69-2.571,2.645-3.453,3.526-3.159C937-539.311,939.569-538.43,941.993-537.548Z" transform="translate(-45.205 1053.976)" fill="#fff"/>
    <g id="Middle_Circle" data-name="Middle Circle" transform="translate(824 406)" fill="none" stroke="#0000dc" stroke-width="2">
      <circle cx="83.5" cy="83.5" r="83.5" stroke="none"/>
      <circle cx="83.5" cy="83.5" r="82.5" fill="none"/>
    </g>
    <g id="Outer_Circle" data-name="Outer Circle" transform="translate(805 387)" fill="none">
      <path d="M102.5,0A102.5,102.5,0,1,1,0,102.5,102.5,102.5,0,0,1,102.5,0Z" stroke="none"/>
      <path d="M 102.5 10 C 51.49531555175781 10 10 51.49531555175781 10 102.5 C 10 153.5046691894531 51.49531555175781 195 102.5 195 C 153.5046691894531 195 195 153.5046691894531 195 102.5 C 195 51.49531555175781 153.5046691894531 10 102.5 10 M 102.5 0 C 159.1091766357422 0 205 45.89082336425781 205 102.5 C 205 159.1091766357422 159.1091766357422 205 102.5 205 C 45.89082336425781 205 0 159.1091766357422 0 102.5 C 0 45.89082336425781 45.89082336425781 0 102.5 0 Z" stroke="none" fill="#0000dc"/>
    </g>
  </g>
</svg>
                  '''),
                    Center(child: RecentProjects())
                  ],
                ))));
  }
}

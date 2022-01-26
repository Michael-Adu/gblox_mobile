# Languages

<aside>
💡 Language Localization

</aside>

![Untitled](Languages%20569cfaaddecd4a4ca2e42f383f6e4f99/Untitled.png)

# Packages used:

1. [Easy Localization](https://pub.dev/packages/easy_localization)
2. [Configurable Expansion Tile](https://pub.dev/packages/configurable_expansion_tile)

# Language Localization

- The languages are maintained by the Easy Localization package. It is initialized on startup of the app in [main.dart](main%20dart%2067fab668d247491e8405c0c26fdbadec.md) as follows:
    
    ```dart
    runApp(EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('fr'),
              Locale('pt'),
              Locale('de')
            ],
            path: 'assets/languages',
            fallbackLocale: const Locale('en'),
            child: const GbloxApp()));
    ```
    
- The locale is used in the Widget build, and loads the previously loaded locale.
    
    ```dart
    localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
    ...
    ```
    
- To enable translation on text, import the easy localization package and add `.tr()` to the Text widget.
    
    ```dart
    import 'package:easy_localization/easy_localization.dart';
    
    Text('applicationName',
                              style: TextStyle(
                                  fontSize: global.device_size.height * 0.04))
                          .tr(),
    ```
    

## Changing translations

- Navigate to `assets/languages` and edit the `.json` files as necessary.
- To add a new language, create a new json file and assign the translations as done in the other files. Add the new Locale in [main.dart](main%20dart%2067fab668d247491e8405c0c26fdbadec.md), and add the option to change to the new language by adding a button in the end drawer.
- The end drawer uses the configurable expansion tile to hide and show the available languages.
    
    ```dart
    ConfigurableExpansionTile(
                            animatedWidgetFollowingHeader: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.arrow_downward,
                                    color: Colors.white,
                                    size:
                                        MediaQuery.of(context).size.height * 0.04)),
                            header: Container(
                                width: MediaQuery.of(context).size.width * 0.255,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'change_language_settings',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height *
                                          0.04),
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
    ```
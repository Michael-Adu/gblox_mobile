# main.dart

![Untitled](main%20dart%2067fab668d247491e8405c0c26fdbadec/Untitled.png)

# Packages Used

1. [flutter_svg](https://pub.dev/packages/flutter_svg)
2. [Scroll Snap List](https://pub.dev/packages/scroll_snap_list)

# Modular Widgets Used

1. GBloxCards *[Modular Widgets](Modular%20Widgets%2072c25ed16f334935a10e40f350c66396.md)  - `gblox_mobile\lib\components\Modular_Widgets\Cards`*

# Pages Used

1. [DeviceSelect](DeviceSelect%207db49aaa7e38469d913e8d66cc712966.md) 
2. [Bluetooth](Bluetooth%208bc8d4623c54494ca438a6e1766c4b11.md) 
3. [Speech to Command](Speech%20to%20Command%203edceb0fd71b4292ac2d5b2937130503.md) 
4. [Mode Menu](Menus%203811786855f945b395875ac60ae391b5/Mode%20Menu%20765e1693a2e54b0b81c16545c03c91ff.md) 

# `void main`

- Responsible for the initialization of
    - the `EasyLocalization` (language localization package),
        
        ```dart
        await EasyLocalization.ensureInitialized();
        ...
        EasyLocalization(
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
        
    - Setting the orientation of the application to landscape and status bar to `immsersiveSticky`
        
        ```dart
        SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
        ```
        

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
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
  });
}
```

## `class GbloxApp`

- Stateful Widget extended by `_GbloxAppState`
- Responsible for loading in initial `BuildContext context`, `localizationsDelegates`, `navigatorKey` and `theme`.
- Creates `GBloxCards` using `startCards`

### Components

- `class CardDetails`
    - Class for holding data used to generate `GBloxCards`
    
    ```dart
    String svg;
      String title;
      Color textBackgroundColor;
      Function? pressed;
      bool compressSVG;
    
      _CardDetails(this.svg, this.title, this.textBackgroundColor, this.pressed,
          this.compressSVG);
    ```
    
- `List<_CardDetails> startCards`
    - Empty growable list of `CardDetails` which is used to generate the row of `GBloxCards` in the body of the widget.
    - Data is added in `void initState()`
    
    ```dart
    late List<_CardDetails> startCards = List<_CardDetails>.empty(growable: true);
    ...
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
    ```
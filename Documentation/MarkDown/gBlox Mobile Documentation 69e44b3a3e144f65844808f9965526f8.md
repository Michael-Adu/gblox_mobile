# gBlox Mobile Documentation

Created: January 14, 2022 10:48 AM
Last Edited Time: January 21, 2022 12:04 PM

# main.dart

## `void main`

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
    

# Code Files

[Codes](gBlox%20Mobile%20Documentation%2069e44b3a3e144f65844808f9965526f8/Codes%20f28f3ab7992940e388eed96a4d12655b.csv)

---

---
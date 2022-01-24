# Global Variables

# global_variables.dart

- Library used to store various variables used throughout the application
- Variables included:

```dart
BluetoothConnection activeConnection
GlobalKey<NavigatorState> navigatorKey
ThemeData globalTheme
InAppWebViewController? webController
String selectedDevice
```

- Stores `displayToast` function used to display toast for debugging purposes.

## Global Classes

- `class ToolboxClass`
    - Class for holding data used to generate `ToolboxCategoryButtons`
    
    ```dart
    class ToolboxClass {
      String name;
      bool category;
      int index;
      String click;
      ToolboxClass(this.name, this.category, this.index, this.click);
    }
    ```
    
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
    
- `class SaveInformation`
    - Class for holding data used to save and load `.gbx` files
    
    ```dart
    class SaveInformation {
      String xml;
      String device;
      String variables;
      String filename;
      String filepath;
      bool internal;
    
      SaveInformation(this.xml, this.device, this.variables, this.filename,
          this.filepath, this.internal);
    }
    ```
    
- `class ShapeData`
    - Class for holding data used to generate sketch shapes
    
    ```dart
    class ShapeData {
      final String name;
      final String svg;
      final Path path;
      ShapeData(this.name, this.svg, this.path);
    }
    ```
    
- Calculates device height and device width and saves it to `Size device_size`.
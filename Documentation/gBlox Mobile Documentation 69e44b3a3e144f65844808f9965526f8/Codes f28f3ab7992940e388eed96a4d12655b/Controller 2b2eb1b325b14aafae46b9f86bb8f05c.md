# Controller

Fully Documented: Fully Documented

<aside>
💡 Used to drive the robot using a controller. Shows speed of the robot and can send instructions to the robot to perform special tasks

</aside>

# Packages Used

1. Control Pad
    
    [control_pad | Flutter Package](https://pub.dev/packages/control_pad)
    
2. Flutter Shape Maker
    
    [Flutter Shape Maker - The Only Custom Paint Toolset You'll Ever Need!](https://fluttershapemaker.com/)
    

# Modular Widgets Used

1. Speedometer - *`gblox_mobile\lib\components\Controller\speedometer.dart`*
2. *Button - `gblox_mobile\lib\components\Modular_Widgets\Button`*

![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled.png)

# Control Pad

```dart
JoystickView(
                        onDirectionChanged:
                            (double degrees, double distanceFromCenter) {
                          varDegress = degrees;
                          varDistance = distanceFromCenter;
                          print("Degrees: " + varDegress.toString());
                          print("Distance: " + varDistance.toString());
                          currentSpeed.value = 15 * varDistance;
                        },
                        backgroundColor: const Color(0xff0000DC),
                        innerCircleColor: Colors.white,
                        iconsColor: Colors.white,
                        size: global.device_size.width * 0.27,
                      )
```

- Using the Control Pad package, the joystick is generated and returns values for the distance from center and its degrees.
- The current speed of the device is calculated by multiplying the distance from center by 15. This is assigned to the value of `currentSpeed`, a `ValueNotifier` used to rebuild the Speedometer widget.

<aside>
⚠️ Attempting to use `setState` in the Joystick resets the initial position of the stick. Use Value Notifiers to mitigate this issue.

</aside>

![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%201.png)

# Speedometer

```dart
ValueListenableBuilder(
                                valueListenable: currentSpeed,
                                builder: (context, value, widget) {
                                  return Speedometer(speed: currentSpeed);
                                }),
```

```dart
Stack(children: [
          ValueListenableBuilder(
              valueListenable: widget.speed!,
              builder: (context, value, widget) {
                updateValue();
                try {
                  final RenderBox renderBox = _speedometerKey.currentContext
                      ?.findRenderObject() as RenderBox;
                  final Size size = renderBox.size;
                  bar_size = Size(size.width * 0.08, size.height * 0.5);
                } catch (e) {}
                return Container(
                    height: bar_size.height * 1.8,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(bar_size.width * 0.9,
                        bar_size.height * 0.3, 0, bar_size.height * 0.3),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: enabledBars
                            .map((bar) => Container(
                                width: bar_size.width * 0.5,
                                margin: EdgeInsets.fromLTRB(
                                    0, 0, bar_size.width * 0.235, 0),
                                child: SvgPicture.string(
                                  '''<svg xmlns="http://www.w3.org/2000/svg" width="21.255" height="208.821" viewBox="0 0 21.255 208.821">
  <path id="Path_120" data-name="Path 120" d="M1551.224,145.084V352.457h-20.255V158.615Q1541.17,151.973,1551.224,145.084Z" transform="translate(-1530.469 -144.136)" fill="#4a4f68" stroke="rgba(0,0,0,0)" stroke-miterlimit="10" stroke-width="1"/>
</svg>
''',
                                  fit: BoxFit.fill,
                                  color: Colors.green,
                                )))
                            .toList()));
              }),
          Container(
              key: _speedometerKey,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: CustomPaint(
                painter: BackgroundPainter(),
                child: Container(width: global.device_size.width * 0.3),
              )),
          Container(
              child: CustomPaint(
            painter: ForwardPainter(),
            child: Container(width: global.device_size.width * 0.3),
          ))
        ]
```

![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%202.png)

- This widget accepts a `ValueNotifier<double>` to fill the empty bars.
- The size of the speedometer is adjusted based on the screen size.
- It uses a Stack of 3 widgets:
    1. The bars indicating the speed, generated based on the value of the current speed passed into the widget. A list generated with a length of the current speed is used to map and return containers containing the green svgs. Its size and spacing is determined by the size allocated to the entire widget.
        
        ![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%203.png)
        
    2. The top curve that covers the bars itself. A `CustomPainter` called `BackgroundPainter` is used to paint over the bars. This was generated from the flutter shape maker with an SVG.
        
        ![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%204.png)
        
    3. The actual shape of the speedometer. A `CustomPainter` called `ShapePainter` is used to paint over the bars. This was generated from the flutter shape maker with an SVG.
        
        ![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%205.png)
        

# Buttons

- These buttons, as shown in `GBloxButtons`, are used to send commands to the robot.

 

```dart
Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: global.device_size.width * 0.1,
                                    child: GBloxButtons(
                                      buttonType: "controller_square",
                                      icon: GBloxCustomSVGs.horn,
                                      pressed: () {
                                        print("Horn Pressed");
                                        try {
                                          global.activeConnection.output.add(
                                              Uint8List.fromList(
                                                  utf8.encode("a")));
                                          print(global.activeConnection);
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                      buttonColor: 0xff1D184B,
                                    ),
                                  ),
                                  Container(
                                      width: global.device_size.width * 0.1,
                                      child: GBloxButtons(
                                        buttonType: "controller_square",
                                        icon: GBloxCustomSVGs.headlights,
                                        pressed: () {
                                          print("Lights Toggled");
                                          try {
                                            global.activeConnection.output.add(
                                                Uint8List.fromList(
                                                    utf8.encode("b")));
                                            print(global.activeConnection);
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                        buttonColor: 0xff1D184B,
                                      ))
                                ])
```

![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%206.png)

- Horn and Lights

```dart
Container(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      width: global.device_size.width * 0.3,
                      height: global.device_size.height * 0.5,
                      child: Container(
                          clipBehavior: Clip.none,
                          child: Transform.rotate(
                              angle: -math.pi / 4,
                              child: Container(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  width: global.device_size.width * 0.22,
                                  height: global.device_size.height * 0.3,
                                  child: GridView(
                                    clipBehavior: Clip.none,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.0,
                                      mainAxisSpacing: 10.0,
                                      crossAxisSpacing: 10.0,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.forwardMovement,
                                          pressed: printval,
                                          buttonColor: 0xffDB8000,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.rotateMovement,
                                          pressed: () async {
                                            global.displayToast(currentSpeed.value
                                                .toInt()
                                                .toString());
                                          },
                                          buttonColor: 0xff1F81E5,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.group_23,
                                          pressed: printval,
                                          buttonColor: 0xff3EA52C,
                                          rotate: true,
                                        ),
                                      ),
                                      Container(
                                        child: GBloxButtons(
                                          buttonType: "controller_circle",
                                          icon: GBloxCustomSVGs.randomMovement,
                                          pressed: printval,
                                          buttonColor: 0xffA62AB5,
                                          rotate: true,
                                        ),
                                      )
                                    ],
                                  )))))
```

![Untitled](Controller%202b2eb1b325b14aafae46b9f86bb8f05c/Untitled%207.png)

- Buttons to make the robot perform special tasks, such as random movement, move forward quickly, rotate the robot etc.

# What is Left?

- Sending the appropriate commands to the robot.
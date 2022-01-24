# Obstacle Detector

<aside>
💡 Used to enable the obstacle detector/avoidance program on the robot

</aside>

# Packages Used

1. flutter_svg
    
    [flutter_svg | Flutter Package](https://pub.dev/packages/flutter_svg)
    

# Modular Widgets Used

1. Switch *- `gblox_mobile\lib\components\Modular_Widgets\Switch`*

# Switching States

![Untitled](Obstacle%20Detector%20fe2100d3f3084473804b740ef8da72e9/Untitled.png)

```dart
List<Widget> falseState = [
    Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: SvgPicture.string(svgs.light_detector_away,
            height: global.device_size.height * 0.25)),
    SvgPicture.string(svgs.light_detector_away,
        height: global.device_size.height * 0.25),
  ];
  List<Widget> trueState = [
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_size.height * 0.25),
    SvgPicture.string(svgs.light_detector_follow,
        height: global.device_size.height * 0.25),
  ];

  late List<Widget> stateWidget = List<Widget>.empty(growable: true);

  void initState() {
    super.initState();
    stateWidget = falseState;
  }
```

```dart
Stack(clipBehavior: Clip.none, children: [
                      Container(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SvgPicture.string(
                            svgs.obstacle_detect,
                            allowDrawingOutsideViewBox: true,
                            height: global.device_size.height * 1.5,
                            alignment: Alignment.topCenter,
                            fit: BoxFit.none,
                          )),
                      Container(
                          alignment: Alignment.center,
                          width: global.device_size.width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: stateWidget,
                          ))
                    ]),
```

- The switch indicates the state of command. It shows whether the robot is moving away from the light source or towards it.
- A Widget called `stateWidget` is used to determine which SVGs are displayed on top.

```dart
Container(
                    alignment: Alignment.center,
                    child: GBloxSwitch(
                      icons: const [
                        GBloxCustomSVGs.followobstacle,
                        GBloxCustomSVGs.avoidobstacle
                      ],
                      switchedFunctions: [
                        () {
                          setState(() {
                            stateWidget = trueState;
                          });
                        },
                        () {
                          setState(() {
                            stateWidget = falseState;
                          });
                        }
                      ],
                    ))
```

- The switch is implemented as shown.

# What is Left?

- Adjusting the size of the SVGs to show properly on all devices
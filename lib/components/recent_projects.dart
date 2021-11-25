import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import './blockly.dart';
import 'dart:math' as math;

class RecentProjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecentProjectsState();
  }
}

class _RecentProjectsState extends State<RecentProjects> {
  List<String> _projects = [
    "Project Hello World",
    "Project Mingo Ultrasonic",
    "Project Mingo Claw"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(children: [
        Card(
            child: Padding(
          padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
          child: const Text(
            "projectsHeader",
            style: TextStyle(
                fontFamily: "Baloo 2", color: Color(0xff0000DC), fontSize: 20),
          ).tr(),
        )),
        CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
                icon: const Icon(Icons.add, color: Color(0xff0000DC)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Blockly()),
                  );
                }))
      ]),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
              children: _projects
                  .map((e) => InkWell(
                      onTap: () {
                        print(e);
                      },
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 10, 0),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontFamily: "Baloo 2",
                                      color: Color(0xff000000)),
                                )),
                            SvgPicture.string(
                              '''<svg xmlns="http://www.w3.org/2000/svg" width="119.172" height="28" viewBox="0 0 119.172 28">
  <path id="Path_273" data-name="Path 273" d="M170.752,375.99H90.543l-4.3,4.01H70.972l-3.063-4.01H51.58V352H67.909l3.063,3.991H86.245l4.3-3.991h80.209Z" transform="translate(-51.58 -352)" fill="#fe8013"/>
</svg>
''',
                              color: Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(1.0),
                            )
                          ],
                        ),
                      ))))
                  .toList()))
    ]));
  }
}

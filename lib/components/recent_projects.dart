import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentProjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecentProjectsState();
  }
}

class _RecentProjectsState extends State<RecentProjects> {
  Iterable<String> _projects = [
    "Project Hello World",
    "Project Mingo Ultrasonic",
    "Project Mingo Claw"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: _projects
                .map((e) => InkWell(
                    onTap: () {
                      print(e);
                    },
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            e,
                            style: const TextStyle(
                                fontFamily: "Baloo 2",
                                color: Color(0xff0000DC)),
                          ),
                          SvgPicture.string(
                              '''<svg xmlns="http://www.w3.org/2000/svg" width="119.172" height="28" viewBox="0 0 119.172 28">
  <path id="Path_273" data-name="Path 273" d="M170.752,375.99H90.543l-4.3,4.01H70.972l-3.063-4.01H51.58V352H67.909l3.063,3.991H86.245l4.3-3.991h80.209Z" transform="translate(-51.58 -352)" fill="#fe8013"/>
</svg>
''')
                        ],
                      ),
                    ))))
                .toList()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../svgs/svgs.dart' as svgs;

class ConnectionInProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConnectionInProgressState();
  }
}

class _ConnectionInProgressState extends State<ConnectionInProgress> {
  Widget build(BuildContext context) {
    return (MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff060841),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("connect_to_device").tr(),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Stack(children: [
              SvgPicture.string(
                svgs.rectangleBackground,
                alignment: Alignment.bottomCenter,
              ),
              Container(
                  padding: const EdgeInsets.all(40),
                  child: SvgPicture.string(svgs.connecting_to_device))
            ]))));
  }
}

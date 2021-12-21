import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../global_variables.dart' as global;

class Builddata extends StatefulWidget {
  const Builddata({Key? key}) : super(key: key);

  @override
  _BuilddataState createState() => _BuilddataState();
}

class _BuilddataState extends State<Builddata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("build_mode").tr(),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Container(
              alignment: Alignment.center,
              child: Text(
                "This page is currently in construction",
                style: TextStyle(color: Colors.white, fontSize: 40),
              )),
        ));
  }
}

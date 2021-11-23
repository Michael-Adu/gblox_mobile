import 'package:flutter/material.dart';
import './components/blockly.dart';
import './components/controller.dart';
import './components/piano.dart';

void main() {
  runApp(GbloxApp());
}

class GbloxApp extends StatelessWidget {
  const GbloxApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('gBlox Mobile Home'),
                  centerTitle: true,
                ),
                drawer: Drawer(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                      ),
                      child: Text('gBlox Mobile'),
                    ),
                    ListTile(
                      title: const Text('Blockly'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Blockly()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Controller'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Controller()),
                        );
                      },
                    ),
                    ListTile(
                        title: const Text('Piano'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PianoApp()),
                          );
                        })
                  ],
                )))));
  }
}

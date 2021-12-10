import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'bluetooth_device_list_entry.dart';

import 'bluetooth_card.dart';
import '../global_variables.dart' as global;

class DiscoveryPage extends StatefulWidget {
  /// If true, discovery starts on page start, otherwise user must press action button.
  final bool start;
  final bool checkAvailable;

  DiscoveryPage({this.start = true, this.checkAvailable = true});

  @override
  _DiscoveryPage createState() => _DiscoveryPage();
}

enum _DeviceAvailability {
  no,
  maybe,
  yes,
}

class _DeviceWithAvailability {
  BluetoothDevice device;
  _DeviceAvailability availability;
  String type;

  _DeviceWithAvailability(this.device, this.availability, this.type);
}

class _DiscoveryPage extends State<DiscoveryPage> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  List<_DeviceWithAvailability> allDevices =
      List<_DeviceWithAvailability>.empty(growable: true);
  bool isDiscovering = false;
  int _focusedIndex = 0;
  double _cardSize = 250;
  _DiscoveryPage();

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      _startDiscovery();
    }
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) async {
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].isConnected == true) {
          try {
            global.activeConnection =
                await BluetoothConnection.toAddress(bondedDevices[i].address)
                    .catchError((onError) async {
              global.activeConnection.finish();
            });
          } catch (ex) {}
          ;
        }
      }
      setState(() {
        for (int i = 0; i < bondedDevices.length; i++) {
          if (bondedDevices[i].name!.contains("HC")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Arduino"));
          } else if (bondedDevices[i].name!.contains("MELLO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mello"));
          } else if (bondedDevices[i].name!.contains("MINGO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mingo"));
          }
        }
      });
    });
  }

  void _restartDiscovery() {
    setState(() {
      results.clear();
      isDiscovering = true;
    });

    _startDiscovery();

    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) {
      setState(() {
        allDevices = bondedDevices
            .map(
              (device) => _DeviceWithAvailability(
                  device,
                  widget.checkAvailable
                      ? _DeviceAvailability.maybe
                      : _DeviceAvailability.yes,
                  device.name!),
            )
            .toList();
      });
    });
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      setState(() {
        final existingIndex = results.indexWhere(
            (element) => element.device.address == r.device.address);
        if (existingIndex >= 0)
          results[existingIndex] = r;
        else
          results.add(r);
        // if (allDevices.any((e) => e.device.address == r.device.address)) {
        // } else {
        if (r.device.name!.contains("HC")) {
          allDevices.add(_DeviceWithAvailability(
              r.device, _DeviceAvailability.maybe, "Arudino"));
        } else if (r.device.name!.contains("MELLO")) {
          allDevices.add(_DeviceWithAvailability(
              r.device, _DeviceAvailability.maybe, "Mello"));
        } else if (r.device.name!.contains("MINGO")) {
          allDevices.add(_DeviceWithAvailability(
              r.device, _DeviceAvailability.maybe, "Mingo"));
        }
        //   }
        // }
      });
    });

    _streamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _streamSubscription?.cancel();

    super.dispose();
  }

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    late _DeviceWithAvailability result;

    result = allDevices[index];
    final device = result.device;
    final address = device.address;
    return Container(
        width: _cardSize,
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: BluetoothCard(
              device: device,
              enabled: result.availability == _DeviceAvailability.maybe,
              type: result.type,
              onTap: () async {
                bool bonded = false;
                try {
                  if (device.isBonded) {
                    if (device.isConnected) {
                      global.displayToast(
                          "This device is already paired and connected!");
                    } else {
                      global.activeConnection =
                          await BluetoothConnection.toAddress(address)
                              .whenComplete(() => setState(() {
                                    allDevices[allDevices.indexOf(result)] =
                                        _DeviceWithAvailability(
                                            BluetoothDevice(
                                              name: device.name ?? '',
                                              address: address,
                                              type: device.type,
                                              bondState: bonded
                                                  ? BluetoothBondState.bonded
                                                  : BluetoothBondState.none,
                                            ),
                                            result.availability,
                                            result.type);
                                    print(bonded
                                        ? BluetoothBondState.bonded
                                        : BluetoothBondState.none);
                                  }));
                    }
                  } else {
                    bonded = (await FlutterBluetoothSerial.instance
                        .bondDeviceAtAddress(address))!;
                    global.activeConnection =
                        await BluetoothConnection.toAddress(address)
                            .whenComplete(() => setState(() {
                                  allDevices[allDevices.indexOf(result)] =
                                      _DeviceWithAvailability(
                                          BluetoothDevice(
                                            name: device.name ?? '',
                                            address: address,
                                            type: device.type,
                                            bondState: bonded
                                                ? BluetoothBondState.bonded
                                                : BluetoothBondState.none,
                                          ),
                                          result.availability,
                                          result.type);
                                  print(bonded
                                      ? BluetoothBondState.bonded
                                      : BluetoothBondState.none);
                                }));
                  }
                  setState(() {
                    allDevices[allDevices.indexOf(result)] =
                        _DeviceWithAvailability(
                            BluetoothDevice(
                              name: device.name ?? '',
                              address: address,
                              type: device.type,
                              bondState: bonded
                                  ? BluetoothBondState.bonded
                                  : BluetoothBondState.none,
                            ),
                            result.availability,
                            result.type);
                    print(bonded
                        ? BluetoothBondState.bonded
                        : BluetoothBondState.none);
                  });
                } catch (ex) {
                  print(ex);
                }
              },
              onLongPress: () async {
                try {
                  bool bonded = false;
                  if (device.isBonded) {
                    print('Unbonding from ${device.address}...');
                    await FlutterBluetoothSerial.instance
                        .removeDeviceBondWithAddress(address);
                    print('Unbonding from ${device.address} has succed');
                  } else {
                    print('Bonding with ${device.address}...');
                    bonded = (await FlutterBluetoothSerial.instance
                        .bondDeviceAtAddress(address))!;
                    print(
                        'Bonding with ${device.address} has ${bonded ? 'succed' : 'failed'}.');
                  }
                  setState(() {
                    allDevices[allDevices.indexOf(result)] =
                        _DeviceWithAvailability(
                            BluetoothDevice(
                              name: device.name ?? '',
                              address: address,
                              type: device.type,
                              bondState: bonded
                                  ? BluetoothBondState.bonded
                                  : BluetoothBondState.none,
                            ),
                            result.availability,
                            result.type);
                  });
                } catch (ex) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error occured while bonding'),
                        content: Text("${ex.toString()}"),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            )));
  }
  //return (Container(width: _cardSize));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff0B0533),
          fontFamily: "Baloo 2",
          scaffoldBackgroundColor: const Color(0xff0B0533),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: isDiscovering
                  ? Text('Discovering devices')
                  : Text('Discovered devices'),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              actions: <Widget>[
                isDiscovering
                    ? FittedBox(
                        child: Container(
                          margin: const EdgeInsets.all(16.0),
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.replay),
                        onPressed: _restartDiscovery,
                      )
              ],
            ),
            body: Container(
                alignment: Alignment.center,
                child: Container(
                    child: Row(children: <Widget>[
                  Expanded(
                      child: ScrollSnapList(
                    onItemFocus: _onItemFocus,
                    itemSize: _cardSize,
                    dynamicItemSize: true,
                    dynamicItemOpacity: 0.5,
                    itemCount: allDevices.length,
                    itemBuilder: _buildListItem,
                  )
                      // ListView(children: list)
                      )
                ])))));
  }
}

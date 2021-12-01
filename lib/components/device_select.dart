import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'bluetooth_device_list_entry.dart';
import 'global_variables.dart' as global;

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
  int? rssi;
  _DeviceAvailability availability;

  _DeviceWithAvailability(this.device, this.availability, [this.rssi]);
}

class _DiscoveryPage extends State<DiscoveryPage> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  List<_DeviceWithAvailability> allDevices =
      List<_DeviceWithAvailability>.empty(growable: true);
  bool isDiscovering = false;

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
      setState(() {
        allDevices = bondedDevices
            .map(
              (device) => _DeviceWithAvailability(
                device,
                widget.checkAvailable
                    ? _DeviceAvailability.maybe
                    : _DeviceAvailability.yes,
              ),
            )
            .toList();
      });
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].isConnected == true) {
          try {
            global.activeConnection =
                await BluetoothConnection.toAddress(bondedDevices[i].address)
                    .catchError((onError) async {
              global.activeConnection.finish();
              setState(() {
                allDevices[allDevices.indexOf(allDevices[i])] =
                    _DeviceWithAvailability(
                        BluetoothDevice(
                          name: bondedDevices[i].name ?? '',
                          address: bondedDevices[i].address,
                          type: bondedDevices[i].type,
                          bondState: bondedDevices[i].isBonded
                              ? BluetoothBondState.bonded
                              : BluetoothBondState.none,
                        ),
                        allDevices[i].availability,
                        allDevices[i].rssi);
                print(bondedDevices[i].isBonded
                    ? BluetoothBondState.bonded
                    : BluetoothBondState.none);
              });
            });
          } catch (ex) {}
        }
      }
      ;
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
              ),
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
      });
    });

    _streamSubscription!.onDone(() {
      allDevices.addAll(results
          .map((device) => _DeviceWithAvailability(
              device.device, _DeviceAvailability.maybe, device.rssi))
          .toList());
      setState(() {
        isDiscovering = false;
      });
    });
  }

  // @TODO . One day there should be `_pairDevice` on long tap on something... ;)

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and cancel discovery
    _streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isDiscovering
            ? Text('Discovering devices')
            : Text('Discovered devices'),
        actions: <Widget>[
          isDiscovering
              ? FittedBox(
                  child: Container(
                    margin: new EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: _restartDiscovery,
                )
        ],
      ),
      body: ListView.builder(
        itemCount: allDevices.length,
        itemBuilder: (BuildContext context, index) {
          _DeviceWithAvailability result = allDevices[index];
          final device = result.device;
          final address = device.address;
          return BluetoothDeviceListEntry(
            device: device,
            rssi: result.rssi,
            enabled: result.availability == _DeviceAvailability.maybe,
            onTap: () async {
              bool bonded = false;
              try {
                if (device.isBonded) {
                  global.activeConnection =
                      await BluetoothConnection.toAddress(address);
                } else {
                  bonded = (await FlutterBluetoothSerial.instance
                      .bondDeviceAtAddress(address))!;
                  global.activeConnection =
                      await BluetoothConnection.toAddress(address);
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
                          result.rssi);
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
                          result.rssi);
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
          );
        },
      ),
      // ListView(children: list)
    );
  }
}

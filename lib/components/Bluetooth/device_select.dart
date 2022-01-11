import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
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
  int rssi;

  _DeviceWithAvailability(this.device, this.availability, this.type, this.rssi);
}

class _DiscoveryPage extends State<DiscoveryPage> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  List<BluetoothDiscoveryResult> results =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  List<_DeviceWithAvailability> allDevices =
      List<_DeviceWithAvailability>.empty(growable: true);
  List<_DeviceWithAvailability> _searchResults =
      List<_DeviceWithAvailability>.empty(growable: true);
  TextEditingController controller = TextEditingController();
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
      var device;
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].isConnected == true) {
          var deviceType;
          device = bondedDevices[i];
          if (device.name!.contains("HC")) {
            deviceType = "HC";
          } else if (device.name!.contains("MELLO")) {
            deviceType = "Mello";
          } else if (device.name!.contains("MINGO")) {
            deviceType = "Mingo";
          }

          try {
            await BluetoothConnection.toAddress(bondedDevices[i].address)
                .catchError((onError) async {
              global.activeConnection.finish();
              setState(() {
                allDevices[i] = _DeviceWithAvailability(
                    BluetoothDevice(
                      name: bondedDevices[i].name ?? '',
                      address: bondedDevices[i].address,
                      type: bondedDevices[i].type,
                      isConnected: false,
                      bondState: BluetoothBondState.bonded,
                    ),
                    _DeviceAvailability.no,
                    deviceType,
                    0);
              });
            });
          } catch (ex) {}
        }
      }
      setState(() {
        for (int i = 0; i < bondedDevices.length; i++) {
          if (bondedDevices[i].name!.contains("HC")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Arduino", 0));
          } else if (bondedDevices[i].name!.contains("MELLO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mello", 0));
          } else if (bondedDevices[i].name!.contains("MINGO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mingo", 0));
          }
        }
      });
    });
  }

  void _restartDiscovery() {
    setState(() {
      allDevices.clear();
      results.clear();
      isDiscovering = true;
    });
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bondedDevices) async {
      var device;
      for (int i = 0; i < bondedDevices.length; i++) {
        if (bondedDevices[i].isConnected == true) {
          var deviceType;
          device = bondedDevices[i];
          if (device.name!.contains("HC")) {
            deviceType = "HC";
          } else if (device.name!.contains("MELLO")) {
            deviceType = "Mello";
          } else if (device.name!.contains("MINGO")) {
            deviceType = "Mingo";
          }
          try {
            await BluetoothConnection.toAddress(bondedDevices[i].address)
                .catchError((onError) async {
              global.activeConnection.finish();
              setState(() {
                allDevices[i] = _DeviceWithAvailability(
                    BluetoothDevice(
                      name: bondedDevices[i].name ?? '',
                      address: bondedDevices[i].address,
                      type: bondedDevices[i].type,
                      isConnected: false,
                      bondState: BluetoothBondState.bonded,
                    ),
                    _DeviceAvailability.no,
                    deviceType,
                    0);
              });
            });
          } catch (ex) {}
        }
      }
      setState(() {
        for (int i = 0; i < bondedDevices.length; i++) {
          if (bondedDevices[i].name!.contains("HC")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Arduino", 0));
          } else if (bondedDevices[i].name!.contains("MELLO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mello", 0));
          } else if (bondedDevices[i].name!.contains("MINGO")) {
            allDevices.add(_DeviceWithAvailability(
                bondedDevices[i], _DeviceAvailability.maybe, "Mingo", 0));
          }
        }
      });
    });

    _startDiscovery();
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
        if (allDevices.any((e) => e.device == r.device)) {
          var deviceName;
          if (r.device.name!.contains("HC")) {
            deviceName = "HC";
          } else if (r.device.name!.contains("MELLO")) {
            deviceName = "Mello";
          } else if (r.device.name!.contains("MINGO")) {
            deviceName = "Mingo";
          } else {
            deviceName = "Arduino";
          }
          setState(() {
            allDevices[allDevices
                    .indexWhere((element) => element.device == r.device)] =
                _DeviceWithAvailability(
                    r.device, _DeviceAvailability.yes, deviceName, r.rssi);
          });
        } else {
          if (r.device.name!.contains("HC")) {
            allDevices.add(_DeviceWithAvailability(
                r.device, _DeviceAvailability.yes, "Arudino", r.rssi));
          } else if (r.device.name!.contains("MELLO")) {
            allDevices.add(_DeviceWithAvailability(
                r.device, _DeviceAvailability.yes, "Mello", r.rssi));
          } else if (r.device.name!.contains("MINGO")) {
            allDevices.add(_DeviceWithAvailability(
                r.device, _DeviceAvailability.yes, "Mingo", r.rssi));
          }
        }
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
    late bool availability;
    switch (result.availability) {
      case _DeviceAvailability.no:
        availability = false;
        break;
      case _DeviceAvailability.yes:
        availability = true;
        break;
      case _DeviceAvailability.maybe:
        availability = false;
        break;
    }
    return Container(
        width: _cardSize * 1.1,
        height: _cardSize,
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: BluetoothCard(
              device: device,
              enabled: availability,
              type: result.type,
              rssi: result.rssi,
              onTap: () async {
                bool bonded = false;
                try {
                  if (device.isBonded) {
                    global.activeConnection =
                        await BluetoothConnection.toAddress(address)
                            .whenComplete(() => setState(() {
                                  allDevices[allDevices.indexOf(result)] =
                                      _DeviceWithAvailability(
                                          BluetoothDevice(
                                            name: device.name ?? '',
                                            address: address,
                                            type: device.type,
                                            isConnected: true,
                                            bondState: bonded
                                                ? BluetoothBondState.bonded
                                                : BluetoothBondState.none,
                                          ),
                                          result.availability,
                                          result.type,
                                          result.rssi);
                                  print(bonded
                                      ? BluetoothBondState.bonded
                                      : BluetoothBondState.none);
                                }));
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
                                            bondState:
                                                BluetoothBondState.bonded,
                                          ),
                                          result.availability,
                                          result.type,
                                          result.rssi);
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
                            result.type,
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
                            result.type,
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
            )));
  }

  Widget _buildSearchItem(BuildContext context, int index) {
    late _DeviceWithAvailability result;

    result = _searchResults[index];
    final device = result.device;
    final address = device.address;
    late bool availability;
    switch (result.availability) {
      case _DeviceAvailability.no:
        availability = false;
        break;
      case _DeviceAvailability.yes:
        availability = true;
        break;
      case _DeviceAvailability.maybe:
        availability = false;
        break;
    }
    return Container(
        width: _cardSize * 1.1,
        height: _cardSize,
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: BluetoothCard(
              device: device,
              enabled: availability,
              type: result.type,
              rssi: result.rssi,
              onTap: () async {
                bool bonded = false;
                try {
                  if (device.isBonded) {
                    global.activeConnection = await BluetoothConnection
                            .toAddress(address)
                        .whenComplete(() => setState(() {
                              allDevices[allDevices.indexOf(result)] =
                                  _DeviceWithAvailability(
                                      BluetoothDevice(
                                        name: device.name ?? '',
                                        address: address,
                                        type: device.type,
                                        isConnected: true,
                                        bondState: bonded
                                            ? BluetoothBondState.bonded
                                            : BluetoothBondState.none,
                                      ),
                                      result.availability,
                                      result.type,
                                      result.rssi);
                              _searchResults[_searchResults.indexOf(result)] =
                                  _DeviceWithAvailability(
                                      BluetoothDevice(
                                        name: device.name ?? '',
                                        address: address,
                                        type: device.type,
                                        isConnected: true,
                                        bondState: bonded
                                            ? BluetoothBondState.bonded
                                            : BluetoothBondState.none,
                                      ),
                                      result.availability,
                                      result.type,
                                      result.rssi);

                              print(bonded
                                  ? BluetoothBondState.bonded
                                  : BluetoothBondState.none);
                            }));
                  } else {
                    bonded = (await FlutterBluetoothSerial.instance
                        .bondDeviceAtAddress(address))!;
                    global.activeConnection = await BluetoothConnection
                            .toAddress(address)
                        .whenComplete(() => setState(() {
                              allDevices[allDevices.indexOf(result)] =
                                  _DeviceWithAvailability(
                                      BluetoothDevice(
                                        name: device.name ?? '',
                                        address: address,
                                        type: device.type,
                                        bondState: BluetoothBondState.bonded,
                                      ),
                                      result.availability,
                                      result.type,
                                      result.rssi);
                              _searchResults[_searchResults.indexOf(result)] =
                                  _DeviceWithAvailability(
                                      BluetoothDevice(
                                        name: device.name ?? '',
                                        address: address,
                                        type: device.type,
                                        isConnected: true,
                                        bondState: bonded
                                            ? BluetoothBondState.bonded
                                            : BluetoothBondState.none,
                                      ),
                                      result.availability,
                                      result.type,
                                      result.rssi);

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
                            result.type,
                            result.rssi);
                    _searchResults[_searchResults.indexOf(result)] =
                        _DeviceWithAvailability(
                            BluetoothDevice(
                              name: device.name ?? '',
                              address: address,
                              type: device.type,
                              isConnected: true,
                              bondState: bonded
                                  ? BluetoothBondState.bonded
                                  : BluetoothBondState.none,
                            ),
                            result.availability,
                            result.type,
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
                            result.type,
                            result.rssi);
                    _searchResults[_searchResults.indexOf(result)] =
                        _DeviceWithAvailability(
                            BluetoothDevice(
                              name: device.name ?? '',
                              address: address,
                              type: device.type,
                              isConnected: true,
                              bondState: bonded
                                  ? BluetoothBondState.bonded
                                  : BluetoothBondState.none,
                            ),
                            result.availability,
                            result.type,
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
            )));
  }

  Widget _searchBox() {
    return Padding(
      padding: EdgeInsets.all(global.device_height * 0.01),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.search),
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search addresses', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(global.navigatorKey.currentContext!),
        home: Scaffold(
            appBar: AppBar(
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDiscovering
                          ? Text("discovering_devices",
                                  style: TextStyle(
                                      fontSize: global.device_height * 0.04))
                              .tr()
                          : Text("discovered_devices",
                                  style: TextStyle(
                                      fontSize: global.device_height * 0.04))
                              .tr(),
                      Container(
                          width: global.device_width * 0.4,
                          child: _searchBox()),
                    ]),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                actions: [
                  Row(
                    children: [
                      isDiscovering
                          ? FittedBox(
                              child: Container(
                                margin: const EdgeInsets.all(16.0),
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            )
                          : IconButton(
                              icon: Icon(Icons.replay),
                              onPressed: _restartDiscovery,
                            )
                    ],
                  )
                ]),
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
                    itemCount:
                        _searchResults.length != 0 || controller.text.isNotEmpty
                            ? _searchResults.length
                            : allDevices.length,
                    itemBuilder:
                        _searchResults.length != 0 || controller.text.isNotEmpty
                            ? _buildSearchItem
                            : _buildListItem,
                  )
                      // ListView(children: list)
                      )
                ])))));
  }

  onSearchTextChanged(String text) async {
    _searchResults.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    allDevices.forEach((device) {
      if (device.device.address.contains(text)) {
        _searchResults.add(device);
      }
    });

    setState(() {});
  }
}

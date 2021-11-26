import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceListEntry extends ListTile {
  BluetoothDeviceListEntry({
    required BluetoothDevice device,
    int? rssi,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool enabled = true,
  }) : super(
          onTap: onTap,
          onLongPress: onLongPress,
          enabled: enabled,
          leading: const Icon(Icons.devices,
              color: Colors.white), // @TODO . !BluetoothClass! class aware icon
          title: Text(device.name ?? "Unknown Device",
              style: TextStyle(color: Colors.white)),
          subtitle: Text(device.address.toString(),
              style: TextStyle(color: Colors.white)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              device.isConnected
                  ? const Icon(Icons.import_export, color: Colors.green)
                  : Container(width: 0, height: 0),
              device.isBonded
                  ? const Icon(Icons.link, color: Colors.white)
                  : Container(width: 0, height: 0),
            ],
          ),
        );
}

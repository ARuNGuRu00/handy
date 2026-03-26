import 'package:flutter_bluetooth_classic_serial/flutter_bluetooth_classic.dart';
import 'package:permission_handler/permission_handler.dart';
import "dart:io";

Future<void> requestBluetoothPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    // Permission.location, // Needed for scanning
  ].request();

  (statuses[Permission.bluetoothConnect]!.isGranted) ? null : exit(0);
}

final bluetoothClassicPlugin = FlutterBluetoothClassic();

Future<bool> isBluetoothEnabled() async {
  try {
    return await bluetoothClassicPlugin.isBluetoothEnabled();
  } catch (e) {
    return false;
  }
}

List<BluetoothDevice> pairedDevices = [];
Map<String, String> pairedDeviceDet = {};
Future<bool> pairedDevice() async {
  try {
    pairedDevices = await bluetoothClassicPlugin.getPairedDevices();
    for (BluetoothDevice device in pairedDevices) {
      pairedDeviceDet[device.name] = device.address;
    }
    return true;
  } catch (e) {
    return false;
  }
}

Future<int> connectDevices(String blueName) async {
  if (pairedDeviceDet.containsKey(blueName)) {
    await bluetoothClassicPlugin.connect(pairedDeviceDet[blueName]!);
    return 200;
  } else {
    return 400;
  }
}

void butTransfer(String message) async {
  await bluetoothClassicPlugin.sendString(message);
}

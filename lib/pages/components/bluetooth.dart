import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter_bluetooth_classic_serial/flutter_bluetooth_classic.dart';

// Future<bool> checkBluetoothPermission() async {
//   if (await Permission.bluetoothConnect.isGranted) {
//     return true;
//   } else {
//     return false;
//   }
// }

Future<void> requestBluetoothPermission() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.bluetooth,
    Permission.bluetoothScan,
    Permission.bluetoothConnect,
    // Permission.location, // Needed for scanning
  ].request();
  statuses[Permission.bluetoothConnect]!.isGranted ? null : exit(0);
}

void bluetoothDevices() async {
  FlutterBluetoothClassic bluetooth = FlutterBluetoothClassic();

  bool isEnabled = await bluetooth.isBluetoothEnabled();
  if (!isEnabled) {
    print("Bluetooth is OFF ❌");
    return;
  }

  List<BluetoothDevice> devices = await bluetooth.getPairedDevices();

  bool connected = false;

  for (var device in devices) {
    print("Device: ${device.name} - ${device.address}");

    if (device.address == "AC:67:B2:17:43:9E") {
      connected = await bluetooth.connect(device.address);
      break; // stop loop after connecting
    }
  }

  if (connected) {
    print("Connected ✅");
    await bluetooth.sendString('Hello World!');
  } else {
    print("Device not found or connection failed ❌");
  }
}

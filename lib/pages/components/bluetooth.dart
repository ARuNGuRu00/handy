import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

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

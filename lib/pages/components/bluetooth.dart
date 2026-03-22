import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
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

Future<String> pairedDevices() async {
  final bluetoothClassicPlugin = BluetoothClassic();
  await bluetoothClassicPlugin.initPermissions();
  List<Device> discoveredDevices = await bluetoothClassicPlugin
      .getPairedDevices();
  for (Device device in discoveredDevices) {
    if (device.name == "board1") {
      try {
        await bluetoothClassicPlugin.connect(
          device.address,
          "00001101-0000-1000-8000-00805f9b34fb",
        );
        await bluetoothClassicPlugin.write("ping");
        await bluetoothClassicPlugin.write("ping");
        await bluetoothClassicPlugin.write("ping");
        await bluetoothClassicPlugin.disconnect();
        return "sent";
      } catch (e) {
        return e.toString();
      }
    }
  }
  return "not connected";
}

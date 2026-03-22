import 'package:flutter/material.dart';
import 'package:handy/pages/components/bluetooth.dart';

class Soundpage extends StatelessWidget {
  const Soundpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bluetooth Devices")),
      body: FutureBuilder<Map<String, String>>(
        future: listBluetooth(),
        builder: (context, snapshot) {
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 📭 No data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Devices Found"));
          }

          // ✅ Data available
          final devices = snapshot.data!;

          return ListView(
            children: devices.entries.map((entry) {
              return ListTile(
                title: Text(entry.key), // Device Name
                subtitle: Text(entry.value), // MAC Address
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

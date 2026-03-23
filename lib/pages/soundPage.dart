import 'package:flutter/material.dart';
// import 'package:handy/pages/components/bluetooth.dart';

class Soundpage extends StatefulWidget {
  const Soundpage({super.key});

  @override
  State<Soundpage> createState() => _SoundpageState();
}

class _SoundpageState extends State<Soundpage> {
  String data = "Paring Devices";
  @override
  void initState() {
    super.initState();
    message();
  }

  Future<void> message() async {
    String message = "hello";
    setState(() {
      data = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bluetooth Devices")),
      body: Text(data),
    );
  }
}

import 'package:flutter/material.dart';

class Switches extends StatelessWidget {
  final String title;
  const Switches({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

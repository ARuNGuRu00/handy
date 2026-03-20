import 'package:flutter/material.dart';
import 'package:handy/pages/soundPage.dart';

class Switches extends StatelessWidget {
  final String title;
  const Switches({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Soundpage()),
          );
        },
        tooltip: 'Increment',
        shape: CircleBorder(),
        elevation: 0,
        backgroundColor: Color.fromRGBO(250, 116, 116, 1),
        foregroundColor: Color.fromRGBO(159, 5, 5, 1),
        child: const Icon(Icons.music_note),
      ),
    );
  }
}

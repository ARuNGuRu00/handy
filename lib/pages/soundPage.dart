import 'package:flutter/material.dart';

class Soundpage extends StatefulWidget {
  const Soundpage({super.key});

  @override
  State<Soundpage> createState() => _SoundpageState();
}

class _SoundpageState extends State<Soundpage> {
  String? selectedBoard;

  List<String> snaps = [
    "Single Snap/Clap",
    "Double Snap/Clap",
    "Triple Snap/Clap",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sound Triggers")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<String>(
              value: selectedBoard,
              hint: Text("select count"),
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.keyboard_arrow_down),

              items: snaps.map((String snap) {
                return DropdownMenuItem<String>(value: snap, child: Text(snap));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedBoard = value!;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: selectedBoard == null ? null : () {},
            child: Text("Save"),
          ),
        ),
      ),
    );
  }
}

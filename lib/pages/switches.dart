import 'package:flutter/material.dart';
import 'package:handy/pages/components/activeButton.dart';
import 'package:handy/pages/components/bluetooth.dart';
import 'package:handy/pages/components/comp.dart';
import 'package:handy/pages/soundPage.dart';

class Switches extends StatefulWidget {
  final String title;
  const Switches({super.key, required this.title});

  @override
  State<Switches> createState() => _SwitchesState();
}

class _SwitchesState extends State<Switches> {
  late final Map<dynamic, dynamic>? det;
  late final List? entries;
  // late String mess;
  @override
  void initState() {
    super.initState();
    det = CompD().layout[widget.title.toLowerCase()];
    entries = det?.entries.toList();
    // print(entries?.elementAt(0));
    // messageCall();
  }

  // void messageCall() async {
  //   final messageTemp = await connectDevices();

  //   setState(() {
  //     mess = messageTemp;
  //   });
  // }

  @override
  void dispose() {
    // Safely disconnect Bluetooth
    try {
      bluetoothClassicPlugin.disconnect();
    } catch (e) {
      null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit_square))],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: entries?.length,
          itemBuilder: (context, index) => SwitchLayout(
            bName: entries?.elementAt(index).key,
            count: entries?.elementAt(index).value,
            bCount: index + 1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Soundpage()),
          );
        },
        shape: CircleBorder(),
        elevation: 0,
        // backgroundColor: Color.fromRGBO(250, 116, 116, 1),
        // foregroundColor: Color.fromRGBO(159, 5, 5, 1),
        child: const Icon(Icons.music_note),
      ),
    );
  }
}

class SwitchLayout extends StatefulWidget {
  final int count;
  final String bName;
  final int bCount;
  const SwitchLayout({
    super.key,
    required this.bName,
    required this.count,
    required this.bCount,
  });

  @override
  State<SwitchLayout> createState() => _SwitchLayoutState();
}

class _SwitchLayoutState extends State<SwitchLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(26, 183, 182, 182),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                // vertical: 10.0,
                // horizontal: 20,
                bottom: 18,
                top: 5,
                left: 8,
              ),
              child: Text(
                'Board ${widget.bCount}',
                style: TextStyle(
                  color: const Color.fromARGB(255, 150, 149, 149),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemCount: widget.count,
              itemBuilder: (context, index) {
                // return ActiveSwitch(sdet: {widget.bName: index + 1});
                return ActiveSwitch(swint: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

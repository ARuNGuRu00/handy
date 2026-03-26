import 'package:flutter/material.dart';
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
  late String mess;
  @override
  void initState() {
    super.initState();
    det = CompD().layout[widget.title.toLowerCase()];
    entries = det?.entries.toList();
    // print(entries?.elementAt(0));
    messageCall();
  }

  void messageCall() async {
    final messageTemp = await connectDevices();

    setState(() {
      mess = messageTemp;
    });
  }

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
      appBar: AppBar(title: Text(mess)),
      body: SafeArea(
        child: ListView.builder(
          itemCount: entries?.length,
          itemBuilder: (context, index) => SwitchLayout(
            bName: entries?.elementAt(index).key,
            count: entries?.elementAt(index).value,
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
        backgroundColor: Color.fromRGBO(250, 116, 116, 1),
        foregroundColor: Color.fromRGBO(159, 5, 5, 1),
        child: const Icon(Icons.music_note),
      ),
    );
  }
}

class SwitchLayout extends StatefulWidget {
  final int count;
  final String bName;
  const SwitchLayout({super.key, required this.bName, required this.count});

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
                widget.bName,
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

class ActiveSwitch extends StatefulWidget {
  // final Map<String, int> sdet;
  final int swint;
  const ActiveSwitch({super.key, required this.swint});

  @override
  State<ActiveSwitch> createState() => _ActiveSwitchState();
}

class _ActiveSwitchState extends State<ActiveSwitch> {
  Color bColor = const Color.fromARGB(255, 234, 233, 233);
  Color cbColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        setState(() {
          bColor = const Color.fromARGB(255, 214, 78, 78);
          cbColor = const Color.fromARGB(255, 255, 255, 255);
        });
        await Future.delayed(Duration(milliseconds: 300));
        setState(() {
          bColor = const Color.fromARGB(255, 234, 233, 233);
          cbColor = Colors.grey;
        });
      },
      onTapUp: (details) {
        // print(widget.sdet);
        // butTransfer(widget.sdet.toString());
        butTransfer(widget.swint.toString());
      },
      // onTapUp: (details) {},
      child: Container(
        decoration: BoxDecoration(
          // color: isOn ? Colors.red.shade300 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          color: bColor,
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Center(
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: cbColor),
            ),
          ),
        ),
      ),
    );
  }
}

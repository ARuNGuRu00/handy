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
  late final bool isPaired;
  // late String mess;
  @override
  void initState() {
    super.initState();
    det = CompD().layout[widget.title.toLowerCase()];
    entries = det?.entries.toList();
    // print(entries?.elementAt(0));
    getPairedDevices();
    // messageCall();
  }

  void getPairedDevices() async {
    final bool getmess = await pairedDevice();

    setState(() {
      isPaired = getmess;
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
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: isPaired
          ? SafeArea(
              child: ListView.builder(
                itemCount: entries?.length,
                itemBuilder: (context, index) => SwitchLayout(
                  bName: entries?.elementAt(index).key,
                  count: (entries?.elementAt(index).value is List)
                      ? entries?.elementAt(index).value[0]
                      : entries?.elementAt(index).value,
                  other: (entries?.elementAt(index).value is List)
                      ? entries?.elementAt(index).value
                      : [],
                  bCount: index + 1,
                ),
              ),
            )
          : CircularProgressIndicator(),
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
  final List other;

  const SwitchLayout({
    super.key,
    required this.bName,
    required this.count,
    required this.bCount,
    required this.other,
  });

  @override
  State<SwitchLayout> createState() => _SwitchLayoutState();
}

class _SwitchLayoutState extends State<SwitchLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            // vertical: 10.0,
            // horizontal: 20,
            top: 10,
            bottom: 3,
            left: 15,
          ),
          child: Text(
            'Board ${widget.bCount}',
            style: TextStyle(color: const Color.fromARGB(255, 150, 149, 149)),
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(26, 183, 182, 182),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 20,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 9,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: widget.count,
                  itemBuilder: (context, index) {
                    bool isEndOfPair = (index + 1) % 2 == 0;
                    // return ActiveSwitch(sdet: {widget.bName: index + 1});
                    return Padding(
                      padding: EdgeInsets.only(
                        right: isEndOfPair ? 2.5 : 0,
                        left: !isEndOfPair ? 2.5 : 0,
                      ),
                      child:
                          (widget.other.isNotEmpty &&
                              (widget.other[1].contains(index + 1)))
                          ? Opacity(
                              opacity: 0.5,
                              child: IgnorePointer(
                                child: ActiveSwitch(
                                  swint: index,
                                  state: 1,
                                  bAddress: pairedDeviceDet[widget.bName],
                                ),
                              ),
                            )
                          : (widget.other.isNotEmpty &&
                                (widget.other[2].contains(index + 1)))
                          ? Opacity(
                              opacity: 0.5,
                              child: IgnorePointer(
                                child: ActiveSwitch(
                                  swint: index,
                                  state: 2,
                                  bAddress: pairedDeviceDet[widget.bName],
                                ),
                              ),
                            )
                          : ActiveSwitch(
                              swint: index,
                              state: 0,
                              bAddress: pairedDeviceDet[widget.bName],
                            ),
                    );
                  },
                ),
              ),
            ),
            if (!pairedDeviceDet.containsKey(widget.bName))
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(169, 163, 162, 162),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bluetooth_disabled),
                          Text("Board is offLine"),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 30,
                        icon: Icon(Icons.refresh),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

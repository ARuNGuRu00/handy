import 'package:flutter/material.dart';
import 'package:handy/pages/components/bluetooth.dart';
import 'package:handy/pages/switches.dart';

class Catogory extends StatefulWidget {
  const Catogory({super.key});

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {
  bool? blueCode;
  @override
  void initState() {
    super.initState();
    blueCheck();
  }

  void blueCheck() async {
    final code = await isBluetoothEnabled();
    setState(() {
      blueCode = code;
      blueCode = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (blueCode == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (blueCode == false) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔵 Icon
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 33, 33).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.bluetooth_disabled,
                size: 60,
                color: const Color.fromARGB(255, 255, 68, 68),
              ),
            ),

            SizedBox(height: 20),

            // 📝 Title
            Text(
              "Bluetooth is OFF",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            // 🧾 Subtitle
            Text(
              "Enable your Bluetooth to continue",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 30),

            // 🔘 Button
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: blueCheck,
                icon: Icon(Icons.refresh),
                label: Text("Refresh"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 68, 68),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Handy",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "KaushanScript",
                color: Color.fromRGBO(245, 81, 81, 1),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(flex: 2, child: TapCard(layoutName: "Living Room")),
              Expanded(child: TapCard(layoutName: "Parking")),
            ],
          ),

          Row(
            children: [
              Expanded(child: TapCard(layoutName: "Bedroom")),
              Expanded(child: TapCard(layoutName: "Store Room")),
            ],
          ),
          Row(
            children: [Expanded(child: TapCard(layoutName: "OutDoor"))],
          ),
        ],
      ),
    );
  }
}

class TapCard extends StatefulWidget {
  final String layoutName;
  const TapCard({super.key, required this.layoutName});

  @override
  State<TapCard> createState() => _TapCardState();
}

class _TapCardState extends State<TapCard> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTapDown: (details) async {
        setState(() {
          _opacity = 0.5;
        });
        await Future.delayed(Duration(milliseconds: 300));
        setState(() {
          _opacity = 1;
        });
      },
      onTapUp: (details) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Switches(title: widget.layoutName),
          ),
        );
      },
      child: Card(
        color: Color.fromRGBO(219, 104, 104, _opacity),
        elevation: 0,
        child: SizedBox(
          height: (width / 2) - 36,
          child: Center(
            child: Text(
              widget.layoutName,
              style: TextStyle(fontFamily: "Ubuntu", fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

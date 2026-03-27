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
    final winHeight = MediaQuery.of(context).size.height;
    if (blueCode == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (blueCode == false) {
      return Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.bluetooth_disabled,
              size: 54,
              color: const Color.fromARGB(255, 228, 97, 88),
            ),
            Text("Turn on your Bluetooth"),
            ElevatedButton.icon(
              onPressed: blueCheck,
              icon: Icon(Icons.refresh),
              label: Text("Refresh"),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: winHeight * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              // gradient: LinearGradient(
              //   colors: [
              //     const Color.fromARGB(255, 255, 139, 153),
              //     Colors.transparent,
              //   ],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              color: Colors.red,
              // ),
            ),
          ),
        ),
        SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: winHeight * 0.02),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_rounded,
                    size: 30,
                    color: const Color.fromARGB(255, 235, 235, 235),
                  ),
                ),
              ),
              SizedBox(height: winHeight * 0.001),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  "Handy",
                  style: TextStyle(
                    fontSize: winHeight * 0.05,
                    fontFamily: "KaushanScript",
                    color: Color.fromRGBO(230, 229, 229, 1),
                  ),
                ),
              ),
              SizedBox(height: winHeight * 0.05),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TapCard(
                      layoutName: "Living Room",
                      img: "asset/icons/living-room.png",
                    ),
                  ),
                  Expanded(
                    child: TapCard(
                      layoutName: "Parking",
                      img: "asset/icons/shed.png",
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: TapCard(
                      layoutName: "Bedroom",
                      img: "asset/icons/hotel.png",
                    ),
                  ),
                  Expanded(
                    child: TapCard(
                      layoutName: "Store Room",
                      img: "asset/icons/ware-house.png",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TapCard(
                      layoutName: "OutDoor",
                      img: "asset/icons/sprout.png",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TapCard extends StatefulWidget {
  final String layoutName;
  final String img;
  const TapCard({super.key, required this.layoutName, required this.img});

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
        color: Color.fromRGBO(219, 217, 217, _opacity),
        elevation: 0,
        child: SizedBox(
          height: (width / 2) - 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, left: 22),
                child: ImageIcon(
                  AssetImage(widget.img),
                  size: width * 0.14,
                  color: Colors.red, // optional tint
                ),
              ),
              Spacer(),
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0, bottom: 24),
                  child: Text(
                    widget.layoutName,
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

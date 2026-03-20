import 'package:flutter/material.dart';
import 'package:handy/pages/switches.dart';

class Catogory extends StatefulWidget {
  const Catogory({super.key});

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 22),
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
                color: Color.fromRGBO(247, 64, 64, 1),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(flex: 2, child: TapCard(layoutName: "Hall")),
              Expanded(child: TapCard(layoutName: "Bedroom")),
            ],
          ),

          Row(
            children: [
              Expanded(child: TapCard(layoutName: "Parking")),
              Expanded(child: TapCard(layoutName: "Balcani")),
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
        color: Color.fromRGBO(242, 85, 85, _opacity),
        child: SizedBox(
          height: 120,
          child: Center(
            child: Text(
              widget.layoutName,
              style: TextStyle(fontFamily: "Ubuntu"),
            ),
          ),
        ),
      ),
    );
  }
}

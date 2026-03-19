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
            child: Text("handy", style: TextStyle(fontSize: 34)),
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
              Expanded(child: TapCard(layoutName: "balcani")),
            ],
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
      onTapDown: (details) {
        setState(() {
          _opacity = 0.5;
        });
      },
      onTapUp: (details) {
        setState(() {
          _opacity = 1;
        });
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
          height: 150,
          child: Center(child: Text(widget.layoutName)),
        ),
      ),
    );
  }
}

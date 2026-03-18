import 'package:flutter/material.dart';

class Catogory extends StatefulWidget {
  const Catogory({super.key});

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {
  double _opacity = 1;
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
              Expanded(
                flex: 2,
                child: Card(
                  color: Color.fromRGBO(242, 85, 85, _opacity),
                  child: SizedBox(
                    height: 150,
                    child: Center(child: Text("Hall")),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Color.fromRGBO(242, 85, 85, _opacity),
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Master"), Text("bedroom")],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Card(
                  color: Color.fromRGBO(242, 85, 85, _opacity),
                  child: SizedBox(
                    height: 150,
                    child: Center(child: Text("Parking")),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      _opacity = 0.4;
                    });
                    await Future.delayed(Duration(milliseconds: 300));
                    setState(() {
                      _opacity = 1;
                    });
                  },
                  child: Card(
                    color: Color.fromRGBO(242, 85, 85, _opacity),
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("bedroom")],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TapCard extends StatefulWidget {
  const TapCard({super.key});

  @override
  State<TapCard> createState() => _TapCardState();
}

class _TapCardState extends State<TapCard> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() => opacity = 0.5);
        await Future.delayed(Duration(milliseconds: 150));
        setState(() => opacity = 1.0);
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 150),
        opacity: opacity,
        child: Card(
          child: SizedBox(height: 120, child: Center(child: Text("Tap Me"))),
        ),
      ),
    );
  }
}

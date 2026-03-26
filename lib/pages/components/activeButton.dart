import 'package:flutter/material.dart';
import 'package:handy/pages/components/bluetooth.dart';

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

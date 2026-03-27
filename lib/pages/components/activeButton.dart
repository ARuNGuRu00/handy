import 'package:flutter/material.dart';
import 'package:handy/pages/components/bluetooth.dart';

class ActiveSwitch extends StatefulWidget {
  // final Map<String, int> sdet;
  final int swint;
  final int state;
  final String? bAddress;
  const ActiveSwitch({
    super.key,
    required this.swint,
    required this.state,
    required this.bAddress,
  });

  @override
  State<ActiveSwitch> createState() => _ActiveSwitchState();
}

class _ActiveSwitchState extends State<ActiveSwitch> {
  Color bColor = const Color.fromARGB(255, 234, 233, 233);
  Color cbColor = Colors.grey;
  void connectMethod(String message) async {
    bool connection = await connectDevices(widget.bAddress!);
    await Future.delayed(Duration(seconds: 1));
    if (connection) {
      butTransfer(message);
    }
  }

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
        connectMethod(widget.swint.toString());
        // butTransfer(widget.swint.toString());
      },

      // onTapUp: (details) {},
      child: Container(
        decoration: BoxDecoration(
          // color: isOn ? Colors.red.shade300 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(7),
          color: bColor,
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Center(
          child: (widget.state == 1)
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(166, 158, 158, 158),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: cbColor),
                  ),
                )
              : (widget.state == 2)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(166, 158, 158, 158),
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5, color: cbColor),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(166, 158, 158, 158),
                        border: Border.all(width: 1.5, color: cbColor),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: cbColor),
                  ),
                ),
        ),
      ),
    );
  }
}

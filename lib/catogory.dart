import 'package:flutter/material.dart';

class Catogory extends StatefulWidget {
  const Catogory({super.key});

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {
  double opacity = 1.0;

  void _onTap() async {
    setState(() => opacity = 0.5); // fade

    await Future.delayed(const Duration(milliseconds: 150));

    setState(() => opacity = 1.0); // back to normal
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Text("handy", style: TextStyle(fontSize: 32)),

          const SizedBox(height: 20),

          GestureDetector(
            onTap: _onTap,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: opacity,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(133, 49, 49, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Tap Me",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

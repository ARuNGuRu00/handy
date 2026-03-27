import 'package:flutter/material.dart';
import 'package:handy/catogory.dart';
import 'package:handy/pages/components/bluetooth.dart';
import 'package:handy/settings.dart';

void main() {
  runApp(LiveScreen());
}

class LiveScreen extends StatefulWidget {
  const LiveScreen({super.key});

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final List<Widget> _pages = [Catogory(), Settings()];
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    requestBluetoothPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Ubuntu",
        primaryColor: const Color.fromARGB(255, 249, 92, 81),
        scaffoldBackgroundColor: const Color.fromARGB(243, 236, 235, 235),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(243, 236, 235, 235),

          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          elevation: 10,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.layers), label: "layout"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}

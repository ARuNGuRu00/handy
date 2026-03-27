import 'package:flutter/material.dart';

class Soundpage extends StatefulWidget {
  const Soundpage({super.key});

  @override
  State<Soundpage> createState() => _SoundpageState();
}

class _SoundpageState extends State<Soundpage> {
  String? selectedBoard;

  List<String> snaps = [
    "Single Snap/Clap",
    "Double Snap/Clap",
    "Triple Snap/Clap",
  ];
  final PageController _controller = PageController();
  int currentPage = 0;
  final List<Map<String, int>> boards = [
    {"Board 1": 6},
    {"Board 2": 12},
    {"Board 3": 2},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sound Triggers")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<String>(
              value: selectedBoard,
              hint: Text("select count"),
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.keyboard_arrow_down),

              items: snaps.map((String snap) {
                return DropdownMenuItem<String>(value: snap, child: Text(snap));
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedBoard = value!;
                });
              },
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _controller,
              itemCount: boards.length,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              itemBuilder: (context, index) {
                final board = boards[index];
                final title = board.keys.first;
                final count = board.values.first;

                return boardCard(title, count);
              },
            ),
          ),
          const SizedBox(height: 15),

          // 🔴 INDICATOR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(boards.length, (index) {
              bool isActive = currentPage == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 30 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: selectedBoard == null ? null : () {},
            child: Text("Save"),
          ),
        ),
      ),
    );
  }

  Widget boardCard(String title, int count) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: count,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  return const Switchs();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget smallBtn(String text) {
    return Container(
      width: 70,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(text),
    );
  }

  Widget bigBtn(String text) {
    return Expanded(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(text),
      ),
    );
  }
}

// 🔘 SWITCH TILE
class Switchs extends StatefulWidget {
  const Switchs({super.key});

  @override
  State<Switchs> createState() => _SwitchsState();
}

class _SwitchsState extends State<Switchs> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isOn = !isOn);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isOn ? Colors.red.shade300 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isOn ? Colors.red : Colors.grey.shade400),
        ),
        child: Center(
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isOn ? Colors.white : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

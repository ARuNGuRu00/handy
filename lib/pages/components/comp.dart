class CompD {
  Map<String, Map> layout = {
    "living room": {
      "Hb1": [
        8,
        [4],
        [],
      ],
      "Hb2": [
        12,
        [8],
        [11, 12],
      ],
      "Hb3": 6,
    },
    "bedroom": {
      "board 1": [
        6,
        [2],
        [5, 6],
      ],
      "board 2": [
        6,
        [],
        [3, 4],
      ],
      "board 3": [
        6,
        [2],
        [],
      ],
    },
    "store room": {
      "Sr1": 8,
      "Sr2": [
        6,
        [],
        [3, 4],
      ],
      "Sr3": [
        6,
        [2],
        [5, 6],
      ],
    },
    "outdoor": {
      "board 1": 8,
      "board 2": [
        12,
        [7],
        [3, 4],
      ],
    },
    "parking": {
      "board 1": [
        6,
        [3],
        [5, 6],
      ],
      "board 2": [
        6,
        [],
        [1, 2, 3, 4],
      ],
    },
  };
}

// void main() {
//   var k = CompD().layout["hall"];
//   // for (int i = 0; i < k.layout["hall"]!.length; i++) {
//   //   print(k.layout["hall"]![i]);
//   // }
//   k?.forEach((k, v) => print('$k: $v'));
// }

// if (index % 2 == 0) {
//   return Row(
//     children: [
//       Expanded(child: ActiveSwitch(swint: index)),
//       SizedBox(width: 10),
//       Expanded(child: ActiveSwitch(swint: index + 1)),
//     ],
//   );
// }
// return SizedBox(); // skip next index

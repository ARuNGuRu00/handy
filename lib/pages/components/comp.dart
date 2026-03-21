class CompD {
  Map<String, Map> layout = {
    "hall": {"board 1": 8, "board 2": 12, "board 3": 6},
    "bedroom": {"board 1": 6, "board 2": 6, "board 3": 6},
    "outdoor": {"board 1": 8, "board 2": 12},
    "balcani": {"board 1": 2},
    "parking": {"board 1": 6, "board 2": 6},
  };
}

// void main() {
//   var k = CompD().layout["hall"];
//   // for (int i = 0; i < k.layout["hall"]!.length; i++) {
//   //   print(k.layout["hall"]![i]);
//   // }
//   k?.forEach((k, v) => print('$k: $v'));
// }

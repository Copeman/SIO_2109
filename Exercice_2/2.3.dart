import 'dart:math' as math;

randomList(list) {
  return list[new math.Random().nextInt(list.length - 1)];
}

main() {
  var list = ['Jean-Michel', 'Marc', 'Vanessa', 'Anne', 'Maximilien', 'Alexandre-Benoît', 'Louise'];
  print(randomList(list));
}


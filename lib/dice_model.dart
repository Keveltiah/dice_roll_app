import 'dart:math';
import 'package:flutter/foundation.dart';
class DiceModel with ChangeNotifier {
  int diceOne = 1;

  int get diceOneCount => diceOne;

  void generateDiceOne() {
    diceOne = Random().nextInt(5) + 1;
    print("diceOne: $diceOne");
    notifyListeners();
  }
}
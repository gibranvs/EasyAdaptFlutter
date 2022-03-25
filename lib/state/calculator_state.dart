import 'package:flutter/material.dart';

class CalculatorState extends ChangeNotifier {
  var index = 1;
  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}

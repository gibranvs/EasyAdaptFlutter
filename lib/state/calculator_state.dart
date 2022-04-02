import 'package:flutter/material.dart';

class CalculatorState extends ChangeNotifier {
  var index = 1;
  var calculator_data = {};
  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  addCalculateData(newData) {
    calculator_data = newData;
    notifyListeners();
  }
}

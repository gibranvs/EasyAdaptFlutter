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

  addAxisF(grados, right) {
    if (right) {
      calculator_data['right']['axisF'] = grados;
    } else {
      calculator_data['left']['axisF'] = grados;
    }
    notifyListeners();
  }
}

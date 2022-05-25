import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  addAxisF(grados, right, context) {
    if (right) {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('axisF', grados);
    } else {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseLeft('axisF', grados);
    }
    notifyListeners();
  }
}

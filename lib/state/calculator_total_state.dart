import 'package:flutter/cupertino.dart';

class CalculatorTotalState extends ChangeNotifier {
  Map dataRight = {"type": "none", "data": {}, "response": {}};
  Map dataLeft = {"type": "none", "data": {}, "response": {}};

  changeDataRight(var type, String name, var newData) {
    Map temp = dataRight['data'] as Map;

    dataRight = {
      "type": type,
      "data": {...temp, name: newData},
      "response": {}
    };
    notifyListeners();
  }

  changeDataLeft(var type, String name, var newData) {
    Map temp = dataLeft['data'] as Map;

    dataLeft = {
      "type": type,
      "data": {...temp, name: newData},
      "response": {}
    };
    notifyListeners();
  }

  changeResponseRight(String name, var newData) {
    Map temp = dataRight['response'] as Map;
    dataRight = {
      "type": dataRight['type'],
      "data": dataRight['data'],
      "response": {...temp, name: newData}
    };
    notifyListeners();
  }

  changeResponseLeft(String name, var newData) {
    Map temp = dataLeft['response'] as Map;
    dataLeft = {
      "type": dataLeft['type'],
      "data": dataLeft['data'],
      "response": {...temp, name: newData}
    };
    notifyListeners();
  }

  deleteDataRight() {
    dataRight = {"type": "none", "data": {}, "response": {}};
    notifyListeners();
  }

  deleteDataLeft() {
    dataLeft = {"type": "none", "data": {}, "response": {}};
    notifyListeners();
  }
}

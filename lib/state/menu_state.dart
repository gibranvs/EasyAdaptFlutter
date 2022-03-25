import 'package:flutter/material.dart';

class MenuState extends ChangeNotifier {
  var index = 0;
  changeIndex(newIndex) {
    index = newIndex;
    notifyListeners();
  }
}

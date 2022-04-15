import 'package:flutter/cupertino.dart';

class ResultState extends ChangeNotifier {
  var data = {};
  changeData(newData) {
    data = newData;
    notifyListeners();
  }
}

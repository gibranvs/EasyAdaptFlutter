import 'package:flutter/material.dart';

class PlayerState extends ChangeNotifier {
  String url = '';
  changeUrl(var newUrl) {
    url = newUrl;
    notifyListeners();
  }
}

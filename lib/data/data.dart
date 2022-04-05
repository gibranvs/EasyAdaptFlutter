import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Data {
  String url = 'http://c1571423.ferozo.com';
  login(email, password, save) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse("$url/api?tipo=login"),
          body: {'correo': email, 'pass': password});
      var data = jsonDecode(response.body);

      if (data['status'] == 1) {
        if (save == true) {
          prefs.setBool('save', true);
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

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
          prefs.setString('idUser', data['response'].toString());
        } else {
          prefs.setString('idUser', data['response'].toString());
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  getPatients() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=get_patients"), body: {
        'id_doctor': prefs.getString('idUser'),
      });
      var data = jsonDecode(response.body);

      if (data['status'] == 1) {
        return [...data['response']];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  postPatients(nombre, surname, telefono, correo) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=set_patient"), body: {
        "nombre": "$nombre $surname",
        "telefono": telefono,
        "correo": correo,
        'id_doctor': prefs.getString('idUser'),
      });
      var data = jsonDecode(response.body);
      if (data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  register(name,mail, password, pais) async {
    try {
      final response =
      await http.post(Uri.parse("$url/api?tipo=set_doctor"), body: {
        "id_doctor": 0,
        "nombre": name,
        "correo": mail,
        'pass': password,
        'pais':pais
      });
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }



  updateDoctor(name,mail, passwordR,passwordN, pais) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response =
      await http.post(Uri.parse("$url/api?tipo=update_doctor"), body: {
        "id_doctor": prefs.getString('idUser'),
        "nombre": name,
        "correo": mail,
        'contrasenaActual': passwordR,
        "contrasenaNueva":passwordN,
        'pais':pais
      });
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Data {
  //String url = 'http://c1571423.ferozo.com';
  String url = 'http://contactlensacademybausch.com/easy_adapt';
  login(email, password, save) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse("$url/api?tipo=login"),
          body: {'correo': email, 'pass': password});
      var data = jsonDecode(response.body);
      print(data);
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

  register(name, mail, password, pais, dni) async {
    print(pais);
    final response =
        await http.post(Uri.parse("$url/api?tipo=set_doctor"), body: {
      "id_doctor": "0",
      "nombre": name,
      "correo": mail,
      'pass': password,
      'pais': pais,
      'dni': dni
    });
    // var data = await jsonDecode(response.body);
    print(response.body);
    print(response.statusCode);

    // if (data['status'] == 1) {
    //   return true;
    // } else {
    //   return false;
    // }
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = await jsonDecode(response.body);
      print(response.body);
      print(response.statusCode);
      print("llego a true");

      if (data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      print("llego a false");
      return false;
    }
  }

  updateDoctor(name, mail, passwordR, passwordN, pais, condition) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse("$url/api?tipo=update_doctor"),
          body: condition
              ? {
                  "id_doctor": prefs.getString('idUser'),
                  "nombre": name,
                  "correo": mail,
                  'contrasenaActual': passwordR,
                  "contrasenaNueva": passwordN,
                  'pais': pais
                }
              : {
                  "id_doctor": prefs.getString('idUser'),
                  "nombre": name,
                  "correo": mail,
                  'pais': pais
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

  getDoctorById() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=get_doctor"), body: {
        'id_doctor': prefs.getString('idUser'),
      });
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 1) {
        return data['response'];
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  setPrescription(id, producto, fecha, ojo, valores, idProducto, duracion,
      adiccion, dominante) async {
    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=set_prescription"), body: {
        "id_paciente": id.toString(),
        "producto": producto.toString(),
        "proxima_fecha": fecha.toString(),
        "ojo": ojo.toString(),
        "valores": valores.toString(),
        "id_producto": idProducto.toString(),
        "duración": duracion.toString(),
        "adiccion": adiccion.toString(),
        "dominante": dominante.toString()
      });
      var data = jsonDecode(response.body);
      if (data['status'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }

  getLastPrescription(id, eye) async {
    try {
      final response = await http.post(
          Uri.parse("$url/api?tipo=get_last_prescription"),
          body: {'id_paciente': id, 'ojo': eye.toString()});
      var data = jsonDecode(response.body);
      print(data);
      if (data['status'] == 1) {
        return data['response'];
      } else {
        return {};
      }
    } catch (e) {
      print(e);

      return {};
    }
  }

  getPrescription(id) async {
    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=get_prescriptions"), body: {
        'id_paciente': id,
      });
      var data = jsonDecode(response.body);
      // print(data['response']);
      print(data['response']);
      if (data['status'] == 1) {
        return [...data['response']];
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final response =
          await http.post(Uri.parse("$url/api?tipo=borrar_cuenta"), body: {
        'id_doctor': prefs.getString('idUser'),
      });
      var data = jsonDecode(response.body);
      // print(data['response']);
      print(data['response']);
    } catch (e) {
      return {};
    }
  }
}

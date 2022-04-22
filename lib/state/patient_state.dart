import 'package:flutter/material.dart';

class PatientState extends ChangeNotifier {
  var patient = {};
  changePatient(patientN) {
    patient = patientN;
    notifyListeners();
  }
}

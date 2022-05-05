import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/data/calculator_data.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

class CalculatorFormSpherical extends StatefulWidget {
  CalculatorFormSpherical({Key? key}) : super(key: key);

  @override
  State<CalculatorFormSpherical> createState() =>
      _CalculatorFormSphericalState();
}

class _CalculatorFormSphericalState extends State<CalculatorFormSpherical> {
  String? selectedValueEsphereR;
  String? selectedValueDistanceR;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [esphere(context), distance(context)],
    );
  }

  Padding esphere(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomDropdownButton2(
        buttonWidth: 150,
        buttonDecoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hint: t.calculatorEsfericos.esphere,
        dropdownItems: esphereValues,
        value: selectedValueEsphereR,
        icon: Container(),
        onChanged: (value) {
          setState(() {
            selectedValueEsphereR = value;
          });
        },
      ),
    );
  }

  Padding distance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomDropdownButton2(
        buttonWidth: 150,
        buttonDecoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hint: t.calculatorEsfericos.distance,
        dropdownItems: distanceValues,
        value: selectedValueDistanceR,
        icon: Container(),
        onChanged: (value) {
          setState(() {
            selectedValueDistanceR = value;
          });
        },
      ),
    );
  }
}

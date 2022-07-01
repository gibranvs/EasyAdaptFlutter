import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/data/calculator_data.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class CalculatorFormMonovision extends StatefulWidget {
  final String eye;

  CalculatorFormMonovision({Key? key, required this.eye}) : super(key: key);

  @override
  State<CalculatorFormMonovision> createState() => _CalculatorFormMonovision();
}

class _CalculatorFormMonovision extends State<CalculatorFormMonovision> {
  String? selectedValueEsphereR;
  String? selectedValueDistanceR;
  String? selectedValueAxisR;
  String? selectedValueCylinderR;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        esphere(context),
        cylinder(context),
        distance(context),
      ],
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
        dropdownItems: esphereToricValues,
        value: selectedValueEsphereR,
        icon: Container(),
        onChanged: (value) {
          setState(() {
            selectedValueEsphereR = value;
            if (widget.eye == "R") {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataRight(
                      'Monovision', 'Sphere', selectedValueEsphereR);
            } else {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataLeft(
                      'Monovision', 'Sphere', selectedValueEsphereR);
            }
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
        dropdownItems: distanceToricValues,
        value: selectedValueDistanceR,
        icon: Container(),
        onChanged: (value) {
          setState(() {
            selectedValueDistanceR = value;
            if (widget.eye == "R") {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataRight(
                      'Monovision', 'Distance', selectedValueDistanceR);
            } else {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataLeft(
                      'Monovision', 'Distance', selectedValueDistanceR);
            }
          });
        },
      ),
    );
  }

  Padding cylinder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomDropdownButton2(
        buttonWidth: 150,
        buttonDecoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hint: t.calculatorToricos.cylinder,
        dropdownItems: cylinderListToricValues,
        value: selectedValueCylinderR,
        icon: Container(),
        onChanged: (value) {
          setState(() {
            selectedValueCylinderR = value;
            if (widget.eye == "R") {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataRight(
                      'Monovision', 'Cylinder', selectedValueCylinderR);
            } else {
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .changeDataLeft(
                      'Monovision', 'Cylinder', selectedValueCylinderR);
            }
          });
        },
      ),
    );
  }
}

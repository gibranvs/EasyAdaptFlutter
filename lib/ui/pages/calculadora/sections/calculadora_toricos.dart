import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class CalculatorToricos extends StatefulWidget {
  CalculatorToricos({Key? key}) : super(key: key);

  @override
  State<CalculatorToricos> createState() => _CalculatorToricos();
}

class _CalculatorToricos extends State<CalculatorToricos> {
  String? selectedValueTypeR;
  String? selectedValueTypeL;
  String? selectedValueEsphereR;
  String? selectedValueEsphereL;
  String? selectedValueDistanceR;
  String? selectedValueDistanceL;
  String? selectedValueCylinderR;
  String? selectedValueCylinderL;
  String? selectedValueAxisR;
  String? selectedValueAxisL;

  List<String> esphereR = [
    '-18.00',
    '-17.50',
    '-17.00',
    '-16.50',
    '-16.00',
    '-15.50',
    '-15.00',
    '-14.50',
    '-14.00',
    '-13.50',
    '-13.00',
    '-12.50',
    '-12.00',
    '-11.50',
    '-11.00',
    '-10.50',
    '-10.00',
    '-9.50',
    '-9.00',
    '-8.50',
    '-8.00',
    '-7.50',
    '-7.00',
    '-6.50',
    '-6.00',
    '-5.75',
    '-5.50',
    '-5.25',
    '-5.00',
    '-4.75',
    '-4.50',
    '-4.25',
    '-4.00',
    '-3.75',
    '-3.50',
    '-3.25',
    '-3.00',
    '-2.75',
    '-2.50',
    '-2.25',
    '-2.00',
    '-1.75',
    '-1.50',
    '-1.25',
    '-1.00',
    '-0.75',
    '-0.50',
    '-0.25',
    '0.00',
    '0.25',
    '0.50',
    '0.75',
    '1.00',
    '1.25',
    '1.50',
    '1.75',
    '2.00',
    '2.25',
    '2.50',
    '2.75',
    '3.00',
    '3.25',
    '3.50',
    '3.75',
    '4.00',
    '4.25',
    '4.50',
    '4.75',
    '5.00',
    '5.25',
    '5.50',
    '5.75',
    '6.00',
    '6.50',
    '7.00',
    '7.50',
    '8.00',
    '8.50',
    '9.00',
    '9.50',
    '10.00',
    '10.50',
    '11.00',
    '11.50',
    '12.00',
    '12.50',
    '13.00',
    '13.50',
    '14.00',
    '14.50',
    '15.00',
    '15.50',
    '16.00',
    '16.50',
    '17.00',
    '17.50',
    '18.00',
  ];
  List<String> distanceL = ['10', '11', '12', '13', '14'];

  List<String> axisList = [
    '0',
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60',
    '65',
    '70',
    '75',
    '80',
    '85',
    '90',
    '95',
    '100',
    '105',
    '110',
    '115',
    '120',
    '125',
    '130',
    '135',
    '140',
    '145',
    '150',
    '155',
    '160',
    '165',
    '170',
    '175',
    '180'
  ];
  List<String> cylinderList = [
    "-4.00",
    "-3.75",
    "-3.50",
    "-3.25",
    "-3.00",
    "-2.75",
    "-2.50",
    "-2.25",
    "-2.00",
    "-1.75",
    "-1.50",
    "-1.25",
    "-1.00",
    "-0.75",
    "-0.50",
    "-0.25",
    "0.00"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarCalculators(context),
            SizedBox(
              height: 5,
            ),
            patients_card_model(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  SizedBox(width: 280, child: Text(t.calculatorEsfericos.text)),
            ),
            eyes(context),
            typesEyes(context),
            esphere(context),
            cylinder(context),
            axis(context),
            distance(context),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 33),
              child: GestureDetector(
                onTap: () {
                  var tempEsphereR =
                      ((double.parse(selectedValueEsphereR ?? "0")) /
                          (1 -
                              (double.parse(selectedValueEsphereR ?? "0") *
                                  (int.parse(selectedValueDistanceR ?? "0") /
                                      1000))));
                  var tempEsphereL =
                      ((double.parse(selectedValueEsphereL ?? "0")) /
                          (1 -
                              (double.parse(selectedValueEsphereL ?? "0") *
                                  (int.parse(selectedValueDistanceL ?? "0") /
                                      1000))));
                  var tempcylinderL = ((double.parse(
                                  selectedValueEsphereL ?? "0") +
                              (double.parse(selectedValueCylinderL ?? "0"))) /
                          ((1 -
                              (((int.parse(selectedValueDistanceL ?? "0")) /
                                      1000) *
                                  (double.parse(selectedValueEsphereL ?? "0") +
                                      double.parse(
                                          selectedValueCylinderL ?? "0"))))) -
                      tempEsphereL);
                  var tempcylinderR = ((double.parse(
                                  selectedValueEsphereR ?? "0") +
                              (double.parse(selectedValueCylinderR ?? "0"))) /
                          ((1 -
                              (((int.parse(selectedValueDistanceR ?? "0")) /
                                      1000) *
                                  (double.parse(selectedValueEsphereR ?? "0") +
                                      double.parse(
                                          selectedValueCylinderR ?? "0"))))) -
                      tempEsphereR);

                  Provider.of<CalculatorState>(context, listen: false)
                      .addCalculateData({
                    'right': {
                      'esphere': tempEsphereR,
                      'distance': selectedValueDistanceR ?? '0',
                      'cylinder': tempcylinderR,
                      'axis': selectedValueAxisR ?? "0"
                    },
                    'left': {
                      'esphere': tempEsphereL,
                      'distance': selectedValueDistanceL ?? '0',
                      'cylinder': tempcylinderL,
                      'axis': selectedValueAxisL ?? '0'
                    },
                  });
                  Navigator.pushNamed(context, '/calc/results/toricos');
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(129, 181, 178, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: Text(
                      t.calculatorEsfericos.button,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }

  Padding cylinder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorToricos.cylinder,
              dropdownItems: cylinderList,
              value: selectedValueCylinderR,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueCylinderR = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorToricos.cylinder,
              dropdownItems: cylinderList,
              value: selectedValueCylinderL,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueCylinderL = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding axis(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorToricos.axis,
              dropdownItems: axisList,
              value: selectedValueAxisR,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueAxisR = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorToricos.axis,
              dropdownItems: axisList,
              value: selectedValueAxisL,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueAxisL = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding distance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.distance,
              dropdownItems: distanceL,
              value: selectedValueDistanceR,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueDistanceR = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.distance,
              dropdownItems: distanceL,
              value: selectedValueDistanceL,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueDistanceL = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding esphere(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.esphere,
              dropdownItems: esphereR,
              value: selectedValueEsphereR,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueEsphereR = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.esphere,
              dropdownItems: esphereR,
              value: selectedValueEsphereL,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueEsphereL = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding typesEyes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.type,
              dropdownItems: [t.calc2TitleToric],
              value: t.calc2TitleToric,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueTypeR = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: 150,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorEsfericos.type,
              dropdownItems: [t.calc2TitleToric],
              value: t.calc2TitleToric,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueTypeL = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding eyes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(129, 181, 178, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Center(
              child: Text(
                t.calculatorEsfericos.eyeRight,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 40,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(129, 181, 178, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Center(
              child: Text(
                t.calculatorEsfericos.eyeLeft,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  patients_card_model() {
    return Container(
        width: double.infinity,
        child: Card(
            elevation: 0.0,
            child: ListTile(
              title: Text(
                "Paciente prueba",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 129, 171, 1.0)),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "p@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('./assets/icons/usuario.png'),
                    size: 52,
                    color: Color.fromRGBO(240, 162, 51, 1.0),
                  ),
                ],
              ),
            )));
  }
}

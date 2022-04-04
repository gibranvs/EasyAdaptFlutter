import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class CalculatorEsfericos extends StatefulWidget {
  CalculatorEsfericos({Key? key}) : super(key: key);

  @override
  State<CalculatorEsfericos> createState() => _CalculatorEsfericosState();
}

class _CalculatorEsfericosState extends State<CalculatorEsfericos> {
  String? selectedValueTypeR;
  String? selectedValueTypeL;
  String? selectedValueEsphereR;
  String? selectedValueEsphereL;
  String? selectedValueDistanceR;
  String? selectedValueDistanceL;

  List<String> esphereR = [
    '-18',
    '-17',
    '-16',
    '-15',
    '-14',
    '-13',
    '-12',
    '-11',
    '-10',
    '-9',
    '-8',
    '-7',
    '-6',
    '-5',
    '-4',
    '-3',
    '-2',
    '-1',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
  ];
  List<String> distanceL = ['10', '11', '12', '13', '14'];
  List<String> itemsType = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
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
            distance(context),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 33),
              child: GestureDetector(
                onTap: () {
                  var tempEsphereR =
                      ((int.parse(selectedValueEsphereR ?? "0")) /
                          (1 -
                              (int.parse(selectedValueEsphereR ?? "0") *
                                  (int.parse(selectedValueDistanceR ?? "0") /
                                      1000))));
                  var tempEsphereL =
                      ((int.parse(selectedValueEsphereL ?? "0")) /
                          (1 -
                              (int.parse(selectedValueEsphereL ?? "0") *
                                  (int.parse(selectedValueDistanceL ?? "0") /
                                      1000))));

                  Provider.of<CalculatorState>(context, listen: false)
                      .addCalculateData({
                    'right': {
                      'esphere': tempEsphereR,
                      'distance': selectedValueDistanceR ?? "0",
                    },
                    'left': {
                      'esphere': tempEsphereL,
                      'distance': selectedValueDistanceL ?? "0",
                    },
                  });
                  Navigator.pushNamed(context, '/calc/results/esferico');
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
          ],
        ),
      )),
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
              dropdownItems: [t.calc1Title],
              value: t.calc1Title,
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
              dropdownItems: [t.calc1Title],
              value: t.calc1Title,
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

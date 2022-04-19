import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

class CalculatorMultifocal extends StatefulWidget {
  CalculatorMultifocal({Key? key}) : super(key: key);

  @override
  State<CalculatorMultifocal> createState() => _CalculatorMultifocal();
}

class _CalculatorMultifocal extends State<CalculatorMultifocal> {
  String? selectedValueTypeR;
  String? selectedValueTypeL;
  String? selectedValueEsphereR;
  String? selectedValueEsphereL;
  String? selectedValueDistanceR;
  String? selectedValueDistanceL;
  String? selectedValueCylinderR;
  String? selectedValueCylinderL;
  String? selectedValueD;
  String? selectedValueAdd;

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
            cylinder(context),
            distance(context),
            rest(context),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 33, right: 33),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, '/calc/results/multifocal-monovision');
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
              hint: t.calculatorMultifocal.cylinder,
              dropdownItems: itemsType,
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
              hint: t.calculatorMultifocal.cylinder,
              dropdownItems: itemsType,
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

  Padding rest(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: double.infinity,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: t.calculatorMultifocal.dominant,
              dropdownItems: itemsType,
              value: selectedValueD,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueD = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CustomDropdownButton2(
              buttonWidth: double.infinity,
              buttonDecoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hint: 'Add',
              dropdownItems: itemsType,
              value: selectedValueAdd,
              icon: Container(),
              onChanged: (value) {
                setState(() {
                  selectedValueAdd = value;
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
              hint: t.calculatorMultifocal.distance,
              dropdownItems: itemsType,
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
              hint: t.calculatorMultifocal.distance,
              dropdownItems: itemsType,
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
              hint: t.calculatorMultifocal.esphere,
              dropdownItems: itemsType,
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
              hint: t.calculatorMultifocal.esphere,
              dropdownItems: itemsType,
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
              hint: t.calculatorMultifocal.type,
              dropdownItems: itemsType,
              value: selectedValueTypeR,
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
              hint: t.calculatorMultifocal.type,
              dropdownItems: itemsType,
              value: selectedValueTypeL,
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
                t.calculatorMultifocal.eyeRight,
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
                t.calculatorMultifocal.eyeLeft,
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

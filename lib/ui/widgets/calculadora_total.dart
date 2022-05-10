import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/data/calculator_data.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:easy_adapt/ui/widgets/calculates/spherical_calculator.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_form_spherical.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_monovision.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_multifocal.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_toric.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class CalculadoraTotal extends StatefulWidget {
  CalculadoraTotal({Key? key}) : super(key: key);

  @override
  State<CalculadoraTotal> createState() => _CalculadoraTotalState();
}

class _CalculadoraTotalState extends State<CalculadoraTotal> {
  String? selectedValueTypeR = t.calc1TitleSpherica;
  String? selectedValueTypeL = t.calc1TitleSpherica;
  String? selectedValueD;
  String? selectedValueAdd;
  List<String> itemsType = [
    t.calculatorEsfericos.eyeRight,
    t.calculatorEsfericos.eyeLeft
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appbar(context),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              _text(),
              Padding(padding: const EdgeInsets.all(8.0), child: eyes(context)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        _eyeTypeRight(),
                        SizedBox(
                          height: 8,
                        ),
                        Builder(builder: (context) {
                          if (t.calc1TitleSpherica == selectedValueTypeR) {
                            return CalculatorFormSpherical(
                              eye: 'R',
                            );
                          }
                          if (t.calc2TitleToric == selectedValueTypeR) {
                            return CalculatorFormToric();
                          }
                          if (t.calc3TitleMultifocal == selectedValueTypeR) {
                            return CalculatorFormMultifocal();
                          }
                          if (t.calc4TitleMonovision == selectedValueTypeR) {
                            return CalculatorFormMonovision();
                          }
                          return Container();
                        })
                      ],
                    ),
                    Column(
                      children: [
                        _eyeTypeLeft(),
                        SizedBox(
                          height: 8,
                        ),
                        Builder(builder: (context) {
                          if (t.calc1TitleSpherica == selectedValueTypeL) {
                            return CalculatorFormSpherical(eye: "L");
                          }
                          if (t.calc2TitleToric == selectedValueTypeL) {
                            return CalculatorFormToric();
                          }
                          if (t.calc3TitleMultifocal == selectedValueTypeL) {
                            return CalculatorFormMultifocal();
                          }
                          if (t.calc4TitleMonovision == selectedValueTypeL) {
                            return CalculatorFormMonovision();
                          }
                          return Container();
                        })
                      ],
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                if (t.calc3TitleMultifocal == selectedValueTypeL ||
                    t.calc4TitleMonovision == selectedValueTypeL ||
                    t.calc3TitleMultifocal == selectedValueTypeR ||
                    t.calc4TitleMonovision == selectedValueTypeR) {
                  return rest(context);
                }
                return Container();
              }),
              _buttonCalculate()
            ],
          ),
        )));
  }

  Column _buttonCalculate() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 33, right: 33),
          child: GestureDetector(
            onTap: () async {
              // ignore: unrelated_type_equality_checks
              //RIGHT
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataRight['type'] ==
                  'Spherical') {
                await sphericalCalculatorRight(context);
              }

              //LEFT

              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['type'] ==
                  'Spherical') {
                await sphericalCalculatorLeft(context);
              }
              Navigator.pushNamed(context, '/results');
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
        ),
      ],
    );
  }

  Padding _eyeTypeLeft() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: CustomDropdownButton2(
        buttonWidth: 150,
        buttonDecoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hint: t.calculatorEsfericos.type,
        dropdownItems: [
          t.calc1TitleSpherica,
          t.calc2TitleToric,
          t.calc3TitleMultifocal,
          t.calc4TitleMonovision
        ],
        value: selectedValueTypeL,
        icon: Container(),
        onChanged: (value) {
          Provider.of<CalculatorTotalState>(context, listen: false)
              .deleteDataLeft();
          setState(() {
            if (value == t.calc3TitleMultifocal) {
              selectedValueTypeL = t.calc3TitleMultifocal;
              selectedValueTypeR = t.calc3TitleMultifocal;
            } else if (value == t.calc4TitleMonovision) {
              selectedValueTypeL = t.calc4TitleMonovision;
              selectedValueTypeR = t.calc4TitleMonovision;
            } else {
              if (selectedValueTypeR == t.calc4TitleMonovision ||
                  selectedValueTypeR == t.calc3TitleMultifocal) {
                selectedValueTypeR = t.calc1TitleSpherica;
              }
              selectedValueTypeL = value;
            }
          });
        },
      ),
    );
  }

  Padding _eyeTypeRight() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: CustomDropdownButton2(
        buttonWidth: 150,
        buttonDecoration: BoxDecoration(
            border: Border.all(
                width: 0.5, color: Color.fromARGB(255, 128, 117, 117)),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hint: t.calculatorEsfericos.type,
        dropdownItems: [
          t.calc1TitleSpherica,
          t.calc2TitleToric,
          t.calc3TitleMultifocal,
          t.calc4TitleMonovision
        ],
        value: selectedValueTypeR,
        icon: Container(),
        onChanged: (value) {
          Provider.of<CalculatorTotalState>(context, listen: false)
              .deleteDataRight();

          setState(() {
            if (value == t.calc3TitleMultifocal) {
              selectedValueTypeL = t.calc3TitleMultifocal;
              selectedValueTypeR = t.calc3TitleMultifocal;
            } else if (value == t.calc4TitleMonovision) {
              selectedValueTypeL = t.calc4TitleMonovision;
              selectedValueTypeR = t.calc4TitleMonovision;
            } else {
              if (selectedValueTypeL == t.calc4TitleMonovision ||
                  selectedValueTypeL == t.calc3TitleMultifocal) {
                selectedValueTypeL = t.calc1TitleSpherica;
              }
              selectedValueTypeR = value;
            }
          });
        },
      ),
    );
  }

  Padding _text() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(width: 280, child: Text(t.calculatorEsfericos.text)),
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

  AppBar _appbar(BuildContext context) {
    return AppBar(
      shape: Border.all(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        t.calculatorTitleHomeScreen,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(56, 118, 159, 1.0),
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: const Color.fromRGBO(56, 118, 159, 1.0),
          )),
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
              dropdownItems: addListValues,
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
}

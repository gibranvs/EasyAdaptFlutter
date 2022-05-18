import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_adapt/data/calculator_data.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:easy_adapt/ui/widgets/calculates/monovision_calculator.dart';
import 'package:easy_adapt/ui/widgets/calculates/multifocal_calculator.dart';
import 'package:easy_adapt/ui/widgets/calculates/spherical_calculator.dart';
import 'package:easy_adapt/ui/widgets/calculates/toric_calculator.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_form_spherical.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_monovision.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_multifocal.dart';
import 'package:easy_adapt/ui/widgets/calculator_forms/calculator_forms_toric.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class CalculadoraTotalInto extends StatefulWidget {
  CalculadoraTotalInto({Key? key}) : super(key: key);

  @override
  State<CalculadoraTotalInto> createState() => _CalculadoraTotalInto();
}

class _CalculadoraTotalInto extends State<CalculadoraTotalInto> {
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
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              getAppBarCalculators(context),
              patients_card_model(),
              Padding(padding: const EdgeInsets.all(8.0), child: eyes(context)),
              _text(),
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
                            return CalculatorFormToric(
                              eye: 'R',
                            );
                          }
                          if (t.calc3TitleMultifocal == selectedValueTypeR) {
                            return CalculatorFormMultifocal(
                              eye: 'R',
                            );
                          }
                          if (t.calc4TitleMonovision == selectedValueTypeR) {
                            return CalculatorFormMonovision(
                              eye: 'R',
                            );
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
                            return CalculatorFormToric(eye: "L");
                          }
                          if (t.calc3TitleMultifocal == selectedValueTypeL) {
                            return CalculatorFormMultifocal(
                              eye: 'L',
                            );
                          }
                          if (t.calc4TitleMonovision == selectedValueTypeL) {
                            return CalculatorFormMonovision(
                              eye: 'L',
                            );
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
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataRight['type'] ==
                  'Toric') {
                await toricCalculatorRight(context);
              }
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataRight['type'] ==
                  'Multifocal') {
                await multifocalCalculatorRight(context);
              }
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataRight['type'] ==
                  'Monovision') {
                await monovisionlCalculatorRight(context);
              }

              //LEFT

              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['type'] ==
                  'Spherical') {
                await sphericalCalculatorLeft(context);
              }
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['type'] ==
                  'Toric') {
                await toricCalculatorLeft(context);
              }
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['type'] ==
                  'Multifocal') {
                await multifocalCalculatorLeft(context);
              }
              if (Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['type'] ==
                  'Monovision') {
                await monovisionCalculatorLeft(context);
              }

              /////////////////////////////Navigator Multifocal

              if (Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataRight['type'] ==
                      'Multifocal' &&
                  Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataLeft['type'] ==
                      'Multifocal') {
                if (double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataRight['data']['Cylinder'] ?? "0.0") <= 0 &&
                    double.parse(
                            Provider.of<CalculatorTotalState>(context, listen: false)
                                .dataRight['data']['Cylinder']) >=
                        -1 &&
                    double.parse(
                            Provider.of<CalculatorTotalState>(context, listen: false)
                                    .dataLeft['data']['Cylinder'] ??
                                "0.0") <=
                        0 &&
                    double.parse(
                            Provider.of<CalculatorTotalState>(context, listen: false)
                                    .dataLeft['data']['Cylinder'] ??
                                "0.0") >=
                        -1) {
                  //////////////////////////////////////////// revisar validacion
                  if (double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataRight['data']['Sphere'])
                              .toInt()
                              .abs() >=
                          (3 *
                              (double.parse(Provider.of<CalculatorTotalState>(context, listen: false)
                                      .dataRight['data']['Cylinder'])
                                  .toInt()
                                  .abs())) &&
                      double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['data']['Sphere'] ?? "0.0")
                              .toInt()
                              .abs() >=
                          (3 *
                              (double.parse(Provider.of<CalculatorTotalState>(context,
                                              listen: false)
                                          .dataLeft['data']['Cylinder'] ??
                                      "0.0")
                                  .toInt()
                                  .abs()))) {
                    Navigator.pushNamed(context, '/results-into');
                  }
                  // Navigator.pushNamed(context, '/results');
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "OK",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 118, 118)),
                                      ))
                                ],
                              )
                            ],
                            title: Text(
                              t.calculatorTotalModalTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text(t.calculatorTotalModalSubTitle));
                      });
                }
              } else {
                Navigator.pushNamed(context, '/results-into');
              }
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
                  if (Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataRight['type'] ==
                          'Multifocal' &&
                      Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataLeft['type'] ==
                          'Multifocal') {
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataRight(
                            'Multifocal', 'Dominante', selectedValueD);
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataLeft(
                            'Multifocal', 'Dominante', selectedValueD);
                  } else {
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataRight(
                            'Monovision', 'Dominante', selectedValueD);
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataLeft(
                            'Monovision', 'Dominante', selectedValueD);
                  }
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

                  if (Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataRight['type'] ==
                          'Multifocal' &&
                      Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataLeft['type'] ==
                          'Multifocal') {
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataRight('Multifocal', 'Add', selectedValueAdd);
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataLeft('Multifocal', 'Add', selectedValueAdd);
                  } else {
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataRight('Monovision', 'Add', selectedValueAdd);
                    Provider.of<CalculatorTotalState>(context, listen: false)
                        .changeDataLeft('Monovision', 'Add', selectedValueAdd);
                  }
                });
              },
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
                Provider.of<ResultState>(context).data['user']['nombre'],
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
                    Provider.of<ResultState>(context).data['user']['correo'],
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

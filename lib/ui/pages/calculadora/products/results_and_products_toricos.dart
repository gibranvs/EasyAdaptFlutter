import 'package:easy_adapt/data/internal_data.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';
import 'package:easy_adapt/state/result_state.dart';

class ResultsAndProductsPageToricos extends StatefulWidget {
  ResultsAndProductsPageToricos({Key? key}) : super(key: key);

  @override
  State<ResultsAndProductsPageToricos> createState() =>
      _ResultsAndProductsPageToricos();
}

class _ResultsAndProductsPageToricos
    extends State<ResultsAndProductsPageToricos> {
  late bool right;
  List dataProductsR = [];
  List dataProductsL = [];
  final ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() {
    loadData();
    right = Provider.of<ResultState>(context).rightValue;

    super.didChangeDependencies();
  }

  loadData() {
    dataProductsL.clear();
    dataProductsR.clear();
    switch (LocaleSettings.currentLocale.languageTag) {
      case "es":
        productsToricosEs.forEach((element) {
          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphere'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphere'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinder'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinder']) {
            dataProductsR.add(element);
          }

          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphere'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphere'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinder'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinder']) {
            dataProductsL.add(element);
          }
        });
        break;
      case "en":
        productsToricosEn.forEach((element) {
          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphere'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphere'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinder'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinder']) {
            dataProductsR.add(element);
          }

          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphereRound'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphereRound'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinderRound'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinderRound']) {
            dataProductsL.add(element);
          }
        });
        break;
      case "pt":
        productsToricosPt.forEach((element) {
          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphereRound'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['esphereRound'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinderRound'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['right']['cylinderRound']) {
            dataProductsR.add(element);
          }

          if (double.parse(element['maxPS']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphere'] &&
              double.parse(element['minPS']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['esphere'] &&
              double.parse(element['cylinderMax']) >
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinder'] &&
              double.parse(element['cylinderMin']) <
                  Provider.of<CalculatorState>(context, listen: false)
                      .calculator_data['left']['cylinder']) {
            dataProductsL.add(element);
          }
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getAppBarCalculators(context),
              patients_card_model(),
              eyes(context, () {
                setState(() {
                  Provider.of<ResultState>(context, listen: false)
                      .changeRightValue(true);
                });
              }, () {
                setState(() {
                  Provider.of<ResultState>(context, listen: false)
                      .changeRightValue(false);
                });
              }),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.calculatorResultsTitle1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Color.fromRGBO(129, 181, 178, 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['esphere']
                                    .toStringAsFixed(2)
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['esphere']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.esphere.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['cylinder']
                                    .toStringAsFixed(2)
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['cylinder']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.cylinder.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['axis']
                                    .toString()
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['axis']
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.axis.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['distance']
                                    .toString()
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['distance']
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.distance.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.calculatorResultsTitle2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Color.fromARGB(255, 7, 69, 163),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['esphereRound']
                                    .toStringAsFixed(2)
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['esphereRound']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.esphere.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['cylinderRound']
                                    .toStringAsFixed(2)
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['cylinderRound']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.cylinder.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['axis']
                                    .toString()
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['axis']
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.axis.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            right == true
                                ? Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['right']['distance']
                                    .toString()
                                : Provider.of<CalculatorState>(context,
                                        listen: false)
                                    .calculator_data['left']['distance']
                                    .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            t.calculatorToricos.distance.toLowerCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.calculatorResultsTitle3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 9, 61, 150)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ...products()
            ],
          ),
        ),
      ),
    );
  }

  Padding eyes(BuildContext context, ontapR, ontapL) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              ontapR();
            },
            child: Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: right == true ? 2 : 0),
                  color: Color.fromRGBO(129, 181, 178, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                child: Text(
                  t.calculatorEsfericos.eyeRight,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ontapL();
            },
            child: Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: right == false ? 2 : 0),
                  color: Color.fromRGBO(129, 181, 178, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                child: Text(
                  t.calculatorEsfericos.eyeLeft,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  products() {
    if (right) {
      return List.generate(
          dataProductsR.length,
          (index) => productModel(
                  2,
                  context,
                  dataProductsR[index]['namePS'],
                  dataProductsR[index]['descriptionPS'],
                  dataProductsR[index]['imagePS'],
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['esphereRound']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['left']['esphereRound']
                          .toStringAsFixed(2),
                  right == true
                      ? double.parse(
                              Provider.of<CalculatorState>(context, listen: false)
                                  .calculator_data['right']['distance'])
                          .toStringAsFixed(2)
                      : double.parse(Provider.of<CalculatorState>(context, listen: false).calculator_data['left']['distance'])
                          .toStringAsFixed(2),
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['cylinderRound']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['left']['cylinderRound']
                          .toStringAsFixed(2),
                  right == true
                      ? double.parse(Provider.of<CalculatorState>(context, listen: false).calculator_data['right']['axis'])
                          .toStringAsFixed(2)
                      : double.parse(Provider.of<CalculatorState>(context, listen: false).calculator_data['left']['axis']).toStringAsFixed(2),
                  true, () {
                setState(() {
                  _controller.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  if (right) {
                    Provider.of<ResultState>(context, listen: false)
                        .changeRightValue(false);
                  } else {
                    Provider.of<ResultState>(context, listen: false)
                        .changeRightValue(true);
                  }
                });
              }, dataProductsR[index], 'calculator'));
    } else {
      return List.generate(
          dataProductsL.length,
          (index) => productModel(
                  2,
                  context,
                  dataProductsL[index]['namePS'],
                  dataProductsL[index]['descriptionPS'],
                  dataProductsL[index]['imagePS'],
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['esphereRound']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['left']['esphereRound']
                          .toStringAsFixed(2),
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['distance']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                                  .calculator_data['left']['distance'] !=
                              null
                          ? Provider.of<CalculatorState>(context, listen: false)
                              .calculator_data['left']['distance']
                              .toString()
                          : "",
                  right == true
                      ? double.parse(Provider.of<CalculatorState>(context, listen: false)
                              .calculator_data['right']['cylinderRound'])
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['left']['cylinderRound']
                          .toStringAsFixed(2),
                  right == true
                      ? double.parse(Provider.of<CalculatorState>(context, listen: false).calculator_data['right']['axis']).toStringAsFixed(2)
                      : double.parse(Provider.of<CalculatorState>(context, listen: false).calculator_data['left']['axis']).toStringAsFixed(2),
                  false, () {
                setState(() {
                  _controller.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                  if (right) {
                    Provider.of<ResultState>(context, listen: false)
                        .changeRightValue(false);
                  } else {
                    Provider.of<ResultState>(context, listen: false)
                        .changeRightValue(true);
                  }
                });
              }, dataProductsL[index], 'calculator'));
    }
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

import 'package:easy_adapt/data/internal_data.dart';
import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/appbar_calculators.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/product_model.dart';
import 'package:easy_adapt/ui/widgets/results/load_data_sphere.dart';
import 'package:easy_adapt/ui/widgets/results/monovision_result_text.dart';
import 'package:easy_adapt/ui/widgets/results/multifocal_result_text.dart';
import 'package:easy_adapt/ui/widgets/results/spherical_result_text.dart';
import 'package:easy_adapt/ui/widgets/results/toric_result_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/../i18n/strings.g.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsAndProducts extends StatefulWidget {
  ResultsAndProducts({Key? key}) : super(key: key);

  @override
  State<ResultsAndProducts> createState() => _ResultsAndProducts();
}

class _ResultsAndProducts extends State<ResultsAndProducts> {
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

  @override
  void dispose() {
    _controller.dispose(); // dispose the controller
    super.dispose();
  }

  loadData() async {
    dataProductsL.clear();
    dataProductsR.clear();
    final prefs = await SharedPreferences.getInstance();

    switch (LocaleSettings.currentLocale.languageTag) {
      case "es":
        //SHPERICAL PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        }
        //Toric PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        }

        //Multifocal PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'es',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['response']['esphereRound'],
            prefs.getString("pais")
          );
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'es',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['response']['esphereRound'],
            prefs.getString("pais")
          );
          setState(() {
            dataProductsL = finalData;
          });
        }
        //MONOVISION PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsR = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'es',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsR = finalData;
            });
          }
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'es',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsL = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'es',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsL = finalData;
            });
          }
        }

        break;
      case "en":
        //SHPERICAL PRODUCTS

        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        }

        //Toric PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        }
        //Multifocal PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'en',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['response']['esphereRound'],
            prefs.getString("pais")
          );
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'en',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['response']['esphereRound'],
            prefs.getString("pais")
          );
          setState(() {
            dataProductsL = finalData;
          });
        }

        //MONOVISION PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsR = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'en',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsR = finalData;
            });
          }
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'en',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsL = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'en',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsL = finalData;
            });
          }
        }

        break;
      case "pt":
        //SHPERICAL PRODUCTS

        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Spherical') {
          var finalData = loadProductsSphere(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        }
        //Toric PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Toric') {
          var finalData = loadProductsToric(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['cylinderRound'],
              prefs.getString("pais"));
          setState(() {
            dataProductsL = finalData;
          });
        } //Multifocal PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'pt',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['response']['esphereRound'],
            prefs.getString("pais")
          );
          setState(() {
            dataProductsR = finalData;
          });
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Multifocal') {
          var finalData = loadProductsMultifocal(
            context,
            'pt',
            Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['response']['esphereRound'],
              prefs.getString("pais")
          );
          setState(() {
            dataProductsL = finalData;
          });
        }
        //MONOVISION PRODUCTS
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataRight['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataRight['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsR = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'pt',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataRight['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsR = finalData;
            });
          }
        }
        if (Provider.of<CalculatorTotalState>(context, listen: false)
                .dataLeft['type'] ==
            'Monovision') {
          if (Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['typeCalc'] ==
              'Spherical') {
            var finalData = loadProductsSphere(
              context,
              'pt',
              Provider.of<CalculatorTotalState>(context, listen: false)
                  .dataLeft['response']['esphereRound'],
                prefs.getString("pais")
            );
            setState(() {
              dataProductsL = finalData;
            });
          } else {
            var finalData = loadProductsToric(
                context,
                'pt',
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['esphereRound'],
                Provider.of<CalculatorTotalState>(context, listen: false)
                    .dataLeft['response']['cylinderRound'],
                prefs.getString("pais"));
            setState(() {
              dataProductsL = finalData;
            });
          }
        }
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
              // patients_card_model(),
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
              Builder(builder: (context) {
                if (right) {
                  switch (
                      Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataRight['type']) {
                    case 'Spherical':
                      return getSphericalTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['esphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['esphereRound']);
                    case 'Toric':
                      return getToricTextResult(
                          Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataRight['response']['esphere'],
                          Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataRight['response']['distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['axis'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['cylinder'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['cylinderRound'], true);

                    case 'Multifocal':
                      return getMultifocalTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['sphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['data']['Distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['data']['Add']);
                    case 'Monovision':
                      return getMonovisionTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['sphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['data']['Distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['cylinder'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataRight['response']['cylinderRound']);

                    default:
                      return Container();
                  }
                } else {
                  switch (
                      Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataLeft['type']) {
                    case 'Spherical':
                      return getSphericalTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['esphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['esphereRound']);
                    case 'Toric':
                      return getToricTextResult(
                          Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataLeft['response']['esphere'],
                          Provider.of<CalculatorTotalState>(context, listen: false)
                              .dataLeft['response']['distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['axis'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['cylinder'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['cylinderRound'],false);

                    case 'Multifocal':
                      return getMultifocalTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['sphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['data']['Distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['add']);

                    case 'Monovision':
                      return getMonovisionTextResult(
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['sphere'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['data']['Distance'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['esphereRound'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['cylinder'],
                          Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['response']['cylinderRound']);

                    default:
                      return Container();
                  }
                }
              }),
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

  products() {
    if (right) {
      return List.generate(
          dataProductsR.length,
          (index) => productModel(
                  1,
                  context,
                  dataProductsR[index]['namePS'],
                  dataProductsR[index]['descriptionPS'],
                  dataProductsR[index]['imagePS'],
                  right == true
                      ? Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataRight['response']['esphereRound']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['left']['esphereRound']
                          .toStringAsFixed(2),
                  right == true
                      ? double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataRight['data']['Distance'])
                          .toStringAsFixed(2)
                      : double.parse(Provider.of<CalculatorState>(context,
                                  listen: false)
                              .calculator_data['left']['distance'])
                          .toStringAsFixed(2),
                  '',
                  '',
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
              },
                  dataProductsR.isNotEmpty ? dataProductsR[index] : {},
                  'inicial',
                  Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['response']['add']));
    } else {
      return List.generate(
          dataProductsL.length,
          (index) => productModel(
                  1,
                  context,
                  dataProductsL[index]['namePS'],
                  dataProductsL[index]['descriptionPS'],
                  dataProductsL[index]['imagePS'],
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['esphereRound']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorTotalState>(context, listen: false)
                          .dataLeft['response']['esphereRound']
                          .toStringAsFixed(2),
                  right == true
                      ? Provider.of<CalculatorState>(context, listen: false)
                          .calculator_data['right']['distance']
                          .toStringAsFixed(2)
                      : Provider.of<CalculatorTotalState>(context,
                                      listen: false)
                                  .dataLeft['data']['Distance'] !=
                              null
                          ? Provider.of<CalculatorTotalState>(context,
                                  listen: false)
                              .dataLeft['data']['Distance']
                              .toString()
                          : "",
                  '',
                  '',
                  right, () {
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
              },
                  dataProductsL.isNotEmpty ? dataProductsL[index] : {},
                  'inicial',
                  Provider.of<CalculatorTotalState>(context, listen: false)
                      .dataLeft['response']['add']));
    }
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
              if (dataProductsR.isEmpty) {
                Fluttertoast.showToast(
                    msg: t.calculatorTotalToast,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 221, 216, 216),
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
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
              if (dataProductsL.isEmpty) {
                Fluttertoast.showToast(
                    msg: t.calculatorTotalToast,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color.fromARGB(255, 221, 216, 216),
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
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

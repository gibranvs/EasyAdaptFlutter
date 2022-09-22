import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class getBottomShetEsferico {
  get(context, title, path, sphere, distance, onNo, rightV, product) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                width: double.infinity,
                height: 270,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Color.fromARGB(255, 128, 117, 117),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(path),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "$sphere / ${distance}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 130,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.orange),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Text(
                                  t.backModalBottom,
                                  style: const TextStyle(
                                      color: Colors.orange, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var list = [];
                              //        Provider.of<ResultState>(context, listen: false)
                              //     .changeData({
                              //   'user': Provider.of<ResultState>(context,
                              //           listen: false)
                              //       .data['user'],
                              //   "presc": [
                              //     ...Provider.of<ResultState>(context,
                              //             listen: false)
                              //         .data['presc'],
                              //     {}
                              //   ]
                              // });
                              if (Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['presc']
                                      .length >
                                  0) {
                                Provider.of<ResultState>(context, listen: false)
                                    .data['presc']
                                    .forEach((element) {
                                  if (element['right'] ==
                                      Provider.of<ResultState>(context,
                                              listen: false)
                                          .rightValue) {
                                    // element =  {
                                    //   'right':right,
                                    //   "name":"10"
                                    // };
                                    print(element['right']);
                                    Provider.of<ResultState>(context,
                                            listen: false)
                                        .editData(
                                            Provider.of<ResultState>(context,
                                                    listen: false)
                                                .rightValue,
                                            {
                                          'right': Provider.of<ResultState>(
                                                  context,
                                                  listen: false)
                                              .rightValue,
                                          'product': product
                                        });
                                  }
                                  if (Provider.of<ResultState>(context,
                                              listen: false)
                                          .data['presc']
                                          .length <
                                      2) {
                                    Provider.of<ResultState>(context,
                                            listen: false)
                                        .changeData({
                                      'user': Provider.of<ResultState>(context,
                                              listen: false)
                                          .data['user'],
                                      "presc": [
                                        ...Provider.of<ResultState>(context,
                                                listen: false)
                                            .data['presc'],
                                        {
                                          'right': Provider.of<ResultState>(
                                                  context,
                                                  listen: false)
                                              .rightValue,
                                          'product': product
                                        }
                                      ]
                                    });
                                  }
                                });
                              }
                              if (Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['presc']
                                      .length ==
                                  0) {
                                Provider.of<ResultState>(context, listen: false)
                                    .changeData({
                                  'user': Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['user'],
                                  "presc": [
                                    {
                                      'right': Provider.of<ResultState>(context,
                                              listen: false)
                                          .rightValue,
                                      'product': product
                                    }
                                  ]
                                });
                              }
                              print(Provider.of<ResultState>(context,
                                      listen: false)
                                  .data);

                              // Provider.of<ResultState>(context, listen: false)
                              //     .changeData({
                              //   'user': Provider.of<ResultState>(context,
                              //           listen: false)
                              //       .data['user'],
                              //   "presc": data
                              // });
                              if (Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['presc']
                                      .length <
                                  2) {
                                (Provider.of<CalculatorTotalState>(context,
                                                    listen: false)
                                                .dataRight['type'] ==
                                            'Multifocal' ||
                                        Provider.of<CalculatorTotalState>(
                                                    context,
                                                    listen: false)
                                                .dataLeft['type'] ==
                                            'Multifocal')
                                    ? await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                Provider.of<ResultState>(
                                                            context,
                                                            listen: false)
                                                        .rightValue
                                                    ? t.saveModalBottomLeft2
                                                    : t.saveModalBottomRight2),
                                            actions: [
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () async {
                                                  ///////MODAL MULTIFOCAL
                                                  onNo();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        })
                                    : await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                Provider.of<ResultState>(
                                                            context,
                                                            listen: false)
                                                        .rightValue
                                                    ? t.saveModalBottomRight
                                                    : t.saveModalBottomLeft),
                                            actions: [
                                              TextButton(
                                                child: Text('No'),
                                                onPressed: () {
                                                  onNo();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Si'),
                                                onPressed: () async {
                                                  Navigator.pushNamed(context,
                                                      '/calc/results/confirm');
                                                },
                                              ),
                                            ],
                                          );
                                        });
                              } else {
                                if (Provider.of<CalculatorTotalState>(context,
                                                listen: false)
                                            .dataRight['type'] ==
                                        'Multifocal' ||
                                    Provider.of<CalculatorTotalState>(context,
                                                listen: false)
                                            .dataLeft['type'] ==
                                        'Multifocal') {
                                  ///////PETICION MULTIFOCAL
                                  var tempR = {};
                                  var tempL = {};

                                  Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['presc']
                                      .forEach((e) {
                                    if (e['right'] == true) {
                                      tempR = e;
                                    } else {
                                      tempL = e ?? {};
                                    }
                                  });

                                  await postPrescription(
                                      [tempR, tempL], context);
                                  Navigator.pushNamed(context, '/prescripcion');
                                } else {
                                  Navigator.pushNamed(
                                      context, '/calc/results/confirm');
                                }
                              }
                            },
                            child: Container(
                              width: 130,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(129, 181, 178, 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Text(
                                  t.saveModalBottom,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  postPrescription(dataF, context) async {
    if (dataF[0]['right'] == true) {
      switch (Provider.of<CalculatorTotalState>(context, listen: false)
          .dataRight['type']) {
        case 'Spherical':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(dataF),
              0,
              getTextRight(context),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          print('spherical');
          break;
        case 'Toric':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(context),
              0,
              getTextRight(context),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          break;
        case 'Multifocal':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(dataF),
              0,
              getTextRight(context),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          print('spherical');
          break;
        case 'Monovision':
          var response = await Data().setPrescription(
              Provider.of<ResultState>(context, listen: false).data['user']
                  ['id'],
              dataF[0]['product']['namePS'],
              calcNextDate(dataF),
              0,
              getTextRight(context),
              dataF[0]['product']['idPS'],
              dataF[0]['product']['daysPS'],
              '',
              '');
          print(response);
          break;

        default:
          return '';
      }
    }

    ///Izquierdo
    if (dataF[0]['right'] == false || dataF[1]['right'] == false) {
      if (dataF[1] != {}) {
        switch (Provider.of<CalculatorTotalState>(context, listen: false)
            .dataLeft['type']) {
          case 'Spherical':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(dataF),
                1,
                getTextLeft(context),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;
          case 'Toric':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(dataF),
                1,
                getTextLeft(context),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;
          case 'Multifocal':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(dataF),
                1,
                getTextLeft(context),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;
          case 'Monovision':
            var response = await Data().setPrescription(
                Provider.of<ResultState>(context, listen: false).data['user']
                    ['id'],
                dataF[1]['product']['namePS'],
                calcNextDate(dataF),
                1,
                getTextLeft(context),
                dataF[1]['product']['idPS'],
                dataF[1]['product']['daysPS'],
                '',
                '');
            print(response);
            break;

          default:
            return '';
        }
      }
    }
  }

  calcNextDate(dataF) {
    if (dataF[0]['product'] != null && dataF[1]['product'] != null) {
      if (int.parse(dataF[0]['product']['daysPS']) >
          int.parse(dataF[1]['product']['daysPS'])) {
        if (dataF[1]['product'] != null) {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[1]['product'] != null
                  ? dataF[1]['product']['daysPS']
                  : "0"))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[1]['product'] != null
                      ? dataF[1]['product']['daysPS']
                      : "0")))
              .toString()
              .split(' ')[0]
              .toString();
        }
      } else {
        if (dataF[1]['product'] != null) {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[0]['product'] != null
                  ? dataF[0]['product']['daysPS']
                  : "0"))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[0]['product'] != null
                      ? dataF[0]['product']['daysPS']
                      : "0")))
              .toString()
              .split(' ')[0]
              .toString();
        } else {
          print(DateTime.now().add(Duration(
              days: int.parse(dataF[0]['product'] != null
                  ? dataF[0]['product']['daysPS']
                  : dataF[1]['product']['daysPS']))));
          return DateTime.now()
              .add(Duration(
                  days: int.parse(dataF[0]['product'] != null
                      ? dataF[0]['product']['daysPS']
                      : dataF[1]['product']['daysPS'])))
              .toString()
              .split(' ')[0]
              .toString();
        }
      }
    }
  }

  getTextRight(context) {
    // Provider.of<CalculatorState>(context).calculator_data['type'] ==
    //                   'esfericos'
    //               ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['distance']} '
    //               : Provider.of<CalculatorState>(context)
    //                           .calculator_data['type'] ==
    //                       'torico'
    //                   ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['cylinderRound']} * ${Provider.of<CalculatorState>(context).calculator_data['right']['axisF']}  '
    //                   : ""

    switch (Provider.of<CalculatorTotalState>(context, listen: false)
        .dataRight['type']) {
      case 'Spherical':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['distance']} ';
      case 'Toric':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['axisF']}';
      case 'Multifocal':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['add'] ?? "0.0") >= 1.5 ? "Add HIGH" : "Add LOW"} ';
      case 'Monovision':
      case 'Toric':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataRight['response']['axisF']}';
      default:
        return '';
    }
  }

  getTextLeft(context) {
    // Provider.of<CalculatorState>(context).calculator_data['type'] ==
    //                   'esfericos'
    //               ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['distance']} '
    //               : Provider.of<CalculatorState>(context)
    //                           .calculator_data['type'] ==
    //                       'torico'
    //                   ? '${Provider.of<CalculatorState>(context).calculator_data['right']['esphereRound']} / ${Provider.of<CalculatorState>(context).calculator_data['right']['cylinderRound']} * ${Provider.of<CalculatorState>(context).calculator_data['right']['axisF']}  '
    //                   : ""

    switch (Provider.of<CalculatorTotalState>(context, listen: false)
        .dataLeft['type']) {
      case 'Spherical':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['distance']} ';
      case 'Toric':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['axisF']}';
      case 'Multifocal':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${double.parse(Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['add'] ?? "0.0") >= 1.5 ? "Add HIGH" : "Add LOW"} ';
      case 'Monovision':
        return '${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['esphereRound']} / ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['cylinderRound']} * ${Provider.of<CalculatorTotalState>(context, listen: false).dataLeft['response']['axisF']}';

      default:
        return '';
    }
  }
}

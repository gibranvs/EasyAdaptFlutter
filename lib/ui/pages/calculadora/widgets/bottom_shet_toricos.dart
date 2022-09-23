import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class getBottomShetToricos {
  get(context, name, path, esphere, cylinder, axis, onNo, rightV, product) {
    int grados = 0;
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                width: double.infinity,
                height: 380,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "$esphere / $cylinder x ${getAxisValue(rightV, axis)} ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(t.toricModalTitle),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (grados > 0) {
                                        setState(() {
                                          grados = grados - 10;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.arrow_back_ios),
                                    iconSize: 30,
                                  ),
                                  Text("$grados°",
                                      style: TextStyle(fontSize: 20)),
                                  RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(180 / 360),
                                      child: IconButton(
                                        onPressed: () {
                                          if (grados < 360) {
                                            setState(() {
                                              grados = grados + 10;
                                            });
                                          }
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                        ),
                                        iconSize: 30,
                                      )),
                                ],
                              ),
                              Text(t.toricModalSubTitle,
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "$esphere / $cylinder x ${getAxisValue(rightV, axis) + grados}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RotationTransition(
                              turns: new AlwaysStoppedAnimation(grados / 360),
                              child: Image.asset(
                                './assets/icons/ojo_ajuste.png',
                                width: 80,
                              )),
                        ],
                      ),
                      SizedBox(
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
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              Provider.of<CalculatorState>(context,
                                      listen: false)
                                  .addAxisF(
                                      getAxisValue(rightV, axis) + grados,
                                      Provider.of<ResultState>(context,
                                              listen: false)
                                          .rightValue,
                                      context);
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
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(Provider.of<ResultState>(
                                                    context,
                                                    listen: false)
                                                .rightValue
                                            ? t.saveModalBottomRight
                                            : t.saveModalBottomLeft),
                                        actions: [
                                          TextButton(
                                            child: Text(t.no),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              onNo();
                                            },
                                          ),
                                          TextButton(
                                            child: Text(t.yes),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  '/calc/results/confirm');
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                Navigator.pushNamed(
                                    context, '/calc/results/confirm');
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
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

getAxisValue(right, axis) {
  if (right) {
    if (axis.toString().split("")[1] == "5") {
      return (double.parse(axis) - 5.0);
    } else {
      return double.parse(axis);
    }
  } else {
    if (axis.toString().split("")[1] == "5") {
      return (double.parse(axis) + 5.0);
    } else {
      return double.parse(axis);
    }
  }
}

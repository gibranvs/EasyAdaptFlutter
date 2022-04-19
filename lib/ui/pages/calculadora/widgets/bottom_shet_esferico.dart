import 'package:easy_adapt/state/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class getBottomShetEsferico {
  get(context, title, path, sphere, distance, onNo, right) {
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
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "$sphere / ${distance}",
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
                              var data = Provider.of<ResultState>(context,
                                      listen: false)
                                  .data['presc']
                                  .forEach((element) {
                                if (element['right']) {
                                  if (element['right'] == right) {
                                    element = {};
                                  } else {
                                    element = {};
                                  }
                                }
                              });
                              Provider.of<ResultState>(context, listen: false)
                                  .changeData({
                                'user': Provider.of<ResultState>(context,
                                        listen: false)
                                    .data['user'],
                                "presc": data
                              });
                              if (Provider.of<ResultState>(context,
                                          listen: false)
                                      .data['presc']
                                      .length <=
                                  2) {
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(right
                                            ? t.saveModalBottomRight
                                            : t.saveModalBottomLeft),
                                        actions: [
                                          FlatButton(
                                            child: Text('No'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              onNo();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text('Si'),
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
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

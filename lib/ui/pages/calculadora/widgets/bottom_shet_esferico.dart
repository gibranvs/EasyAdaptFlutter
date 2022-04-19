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
                            const  SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "$sphere / ${distance}",
                                    style:const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      const      SizedBox(
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
                              if(Provider.of<ResultState>(context,
                                  listen: false)
                                  .data['presc']
                                  .length >0){
                               Provider.of<ResultState>(context,
                                    listen: false)
                                    .data['presc']
                                    .forEach((element) {


                                    if (element['right'] == Provider.of<ResultState>(context, listen: false).rightValue) {
                                      // element =  {
                                      //   'right':right,
                                      //   "name":"10"
                                      // };
                                      print(element['right']);
                                      Provider.of<ResultState>(context, listen: false).editData(Provider.of<ResultState>(context, listen: false).rightValue, {
                                        'right':Provider.of<ResultState>(context, listen: false).rightValue,
                                        'product':product
                                      } );
                                    }
                                    if(Provider.of<ResultState>(context,
                                        listen: false)
                                        .data['presc']
                                        .length <2){
                                      Provider.of<ResultState>(context, listen: false)
                                          .changeData({
                                        'user': Provider.of<ResultState>(context,
                                            listen: false)
                                            .data['user'],
                                        "presc": [
                                          ...Provider.of<ResultState>(context,
                                              listen: false)
                                              .data['presc'],
                                          { 'right':Provider.of<ResultState>(context, listen: false).rightValue,
                                            'product':product
                                          }
                                        ]
                                      });
                                    }

                                });
                              }
                              if(Provider.of<ResultState>(context,
                                  listen: false)
                                  .data['presc']
                                  .length ==0){
                                Provider.of<ResultState>(context, listen: false)
                                    .changeData({
                                  'user': Provider.of<ResultState>(context,
                                      listen: false)
                                      .data['user'],
                                  "presc": [
                                   {
                                     'right':Provider.of<ResultState>(context, listen: false).rightValue,
                                     'product':product

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
                                await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(Provider.of<ResultState>(context, listen: false).rightValue
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

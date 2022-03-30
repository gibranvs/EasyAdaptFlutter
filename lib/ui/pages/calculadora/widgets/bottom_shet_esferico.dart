import 'package:flutter/material.dart';

class getBottomShetEsferico {
  get(context) {
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
                                color: Colors.lightBlueAccent,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Lunare Tri-Color",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "-2.00 / 0.00 x 0",
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
                                  'ATRÁS',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                          '¿Guardar solo la prescripción del ojo derecho?'),
                                      actions: [
                                        FlatButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
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
                                  'GUARDAR',
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

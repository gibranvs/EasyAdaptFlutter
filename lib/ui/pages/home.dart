import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var t;
  HomePage({Key? key, required this.t}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var t = widget.t;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                child: Positioned(
                    right: 0,
                    left: 0,
                    bottom: 35,
                    child: Center(
                        child: Text(
                      "V 1.0.1",
                      style:
                          TextStyle(color: Color.fromRGBO(179, 179, 179, 1.0)),
                    ))),
              ),
              Container(
                child: Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Image.asset('./assets/fondo_cuadrado.png')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAppBarWithLogos(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          t.titleHomeScreen,
                          style: TextStyle(
                              fontSize: 28,
                              color: Color.fromRGBO(240, 162, 51, 1.0)),
                        ),
                        Text(
                          t.subtitleHomeScreen,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(179, 179, 179, 1.0)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            height: 90,
                            child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      t.card1HomeScreen,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calculate_rounded,
                                        size: 40,
                                        color:
                                            Color.fromRGBO(240, 162, 51, 1.0),
                                      ),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: double.infinity,
                            height: 90,
                            child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      t.card2HomeScreen,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.menu_book_sharp,
                                        size: 40,
                                        color:
                                            Color.fromRGBO(240, 162, 51, 1.0),
                                      ),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: double.infinity,
                            height: 90,
                            child: Card(
                                elevation: 2.0,
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      t.card3HomeScreen,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        size: 40,
                                        color:
                                            Color.fromRGBO(240, 162, 51, 1.0),
                                      ),
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

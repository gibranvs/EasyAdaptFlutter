import 'package:easy_adapt/ui/widgets/appBar_with_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

class InitialPage extends StatefulWidget {
  var t;
  InitialPage({Key? key, required this.t}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPage();
}

class _InitialPage extends State<InitialPage> {
  String value = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              child: Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Image.asset('./assets/fondo_cuadrado.png')),
            ),
            Container(
              child: Positioned(
                  right: 0,
                  left: 0,
                  bottom: 33,
                  child: Column(
                    children: [
                      Text(
                        t.alertBottomTitleHomeScreen,
                        style: TextStyle(
                            color: Color.fromRGBO(102, 133, 153, 1.0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${t.alertBottomSubtitleHomeScreen} 213300202C5437",
                        style: TextStyle(
                            color: Color.fromARGB(255, 153, 138, 153),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAppBarWithLogo(),
                  Center(
                    child: Image.asset(
                      './assets/logo.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/calculator-total');
                      },
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(129, 181, 178, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Center(
                          child: Text(
                            t.calculatorTitleHomeScreen,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(69, 130, 178, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Center(
                          child: Text(
                            t.loginTitleHomeScreen,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: t.dontHaveAccountTitleHomeScreen,
                          style: TextStyle(
                              color: Color.fromRGBO(126, 143, 158, 1.0))),
                      TextSpan(
                          text: ' ${t.dontHaveAccountSubtitleHomeScreen} ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');
                            },
                          style: TextStyle(
                              color: Color.fromRGBO(90, 116, 134, 1.0),
                              fontWeight: FontWeight.bold))
                    ])),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: DropdownButton<String?>(
                      value: value,
                      items: const [
                        DropdownMenuItem<String>(
                            value: '1', child: Text('English')),
                        DropdownMenuItem<String>(
                            value: '2', child: Text('Español')),
                        DropdownMenuItem<String>(
                            value: '3', child: Text('Portugués')),
                      ],
                      onChanged: (v) {
                        setState(() {
                          value = v!;
                          if (value == '1') {
                            LocaleSettings.setLocaleRaw('en');
                          }
                          if (value == '2') {
                            LocaleSettings.setLocaleRaw('es');
                          }
                          if (value == '3') {
                            LocaleSettings.setLocaleRaw('pt');
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

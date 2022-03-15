import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String value = '1';

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "BAUSCH + LOMB",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 133, 153, 1.0),
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
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
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(129, 181, 178, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Center(
                        child: Text(
                          t.calculatorTitleHomeScreen,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(69, 130, 178, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Center(
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                          text: '¿No tienes cuenta?',
                          style: TextStyle(
                              color: Color.fromRGBO(126, 143, 158, 1.0))),
                      TextSpan(
                          text: ' crea una',
                          style: TextStyle(
                              color: Color.fromRGBO(126, 143, 158, 1.0))),
                      TextSpan(
                          text: ' aquí',
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
                            value: '1', child: Text('Español')),
                        DropdownMenuItem<String>(
                            value: '2', child: Text('Portugués')),
                        DropdownMenuItem<String>(
                            value: '3', child: Text('English'))
                      ],
                      onChanged: (v) {
                        setState(() {
                          value = v!;
                          if (value == '1') {
                            LocaleSettings.setLocaleRaw('es');
                          }
                          if (value == '2') {
                            LocaleSettings.setLocaleRaw('pt');
                          }
                          if (value == '3') {
                            LocaleSettings.setLocaleRaw('en');
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                        "Aviso de privacidad",
                        style: TextStyle(
                            color: Color.fromRGBO(102, 133, 153, 1.0),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "No. de Aviso de Publicidad : 213300202C5437",
                        style: TextStyle(
                            color: Color.fromARGB(255, 153, 138, 153),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

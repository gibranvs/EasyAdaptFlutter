import 'package:easy_adapt/ui/widgets/appBar_with_logo.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  var t;
  LoginPage({Key? key, required this.t}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String value = '1';

  @override
  Widget build(BuildContext context) {
    var t = widget.t;

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
                  getAppBarWithLogo(),
                  Center(
                    child: Image.asset(
                      './assets/logo.png',
                      width: 130,
                      height: 130,
                    ),
                  ),
                  // padding: const EdgeInsets.only(left: 20, right: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t.titleLoginScreen,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Color.fromRGBO(69, 130, 178, 1.0)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                t.subtitleLoginScreen,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        getTextFieldModelSquare(t.hintTextEmailRegisterScreen),
                        const SizedBox(
                          height: 25,
                        ),
                        getTextFieldModelSquare(
                            t.hintTextPasswordRegisterScreen),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(129, 181, 178, 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Center(
                            child: Text(
                              t.titleButtonLoginScreen,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(value: false, onChanged: (v) {}),
                      const SizedBox(
                        width: 1,
                      ),
                      Text(t.savePasswordLoginScreen)
                    ],
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
          ],
        ),
      )),
    );
  }
}
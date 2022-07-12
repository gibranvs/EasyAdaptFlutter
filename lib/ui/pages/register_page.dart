import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_adapt/data/data.dart';

import '../../i18n/strings.g.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  var t;

  RegisterPage({Key? key, required this.t}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _dNI = TextEditingController();
  bool checkTerms = false;
  String? selectedValue;
  List countrys = [
    "Argentina",
    "Brasil",
    "Colombia",
    "Ecuador",
    "México",
    "Perú",
    "Venezuela",
    "Bolivia",
    "Uruguay",
    "Paraguay",
    "Chile"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border.all(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          widget.t.titleAppBarRegisterScreen,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 118, 159, 1.0),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: const Color.fromRGBO(56, 118, 159, 1.0),
            )),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  widget.t.titleWelcomeRegisterScreen,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(56, 118, 159, 1.0),
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  widget.t.subtitleWelcomeRegisterScreen,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextNameRegisterScreen, _name, false),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextEmailRegisterScreen, _mail, false),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextPasswordRegisterScreen, _password, true),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare(
                    widget.t.hintTextConfirmPasswordRegisterScreen,
                    _passwordConfirm,
                    true),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                          color: Color.fromARGB(255, 167, 167, 168))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.t.hintTextCountryRegisterScreen,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                      items: countrys
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                          for (var i = 0; i < countrys.length; i++) {
                            if (value == countrys[i]) {
                              _country.text = (i + 1).toString();
                            }
                          }
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                getTextFieldModelSquare('CURP/DNI', _dNI, false),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: checkTerms,
                        onChanged: (v) {
                          setState(() {
                            checkTerms = true;
                          });
                        }),
                    const SizedBox(
                      width: 1,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: widget.t.titleAcceptRegisterScreen,
                          style: const TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ' ${widget.t.subtitleAcceptRegisterScreen}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/terms');
                            },
                          style: const TextStyle(
                              color: const Color.fromRGBO(56, 118, 159, 1.0),
                              fontWeight: FontWeight.bold))
                    ])),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () async {
                if (checkTerms) {
                  if (_password.text == _passwordConfirm.text) {
                    var resp = await Data().register(_name.text, _mail.text,
                        _password.text, _country.text, _dNI.text);
                    if (resp) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(t.modalText1TitleRegisterScreen),
                              content: Text(t.modalText1RegisterScreen),
                              actions: [
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/login');
                                  },
                                )
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(t.loginModalErrorTitle),
                              content: Text(t.modalText2RegisterScreen),
                              actions: [
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(t.loginModalErrorTitle),
                            content: Text(t.modalText3RegisterScreen),
                            actions: [
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  }
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(t.loginModalErrorTitle),
                          content: Text(t.modalText4RegisterScreen),
                          actions: [
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(129, 181, 178, 1.0)),
                child: Center(
                  child: Text(
                    widget.t.titleAppBarRegisterScreen,
                    style: const TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  getTextFieldModelSquare(text, controller, obscure) {
    return TextField(
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 18),
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 5))),
    );
  }
}

import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/../i18n/strings.g.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _mail = TextEditingController();

  TextEditingController _country = TextEditingController();

  TextEditingController _passwordR = TextEditingController();

  TextEditingController _passwordN = TextEditingController();

  TextEditingController _passwordC = TextEditingController();
  String name = '';
  String mail = '';
  bool loading = true;

  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  loadData() async {
    var resp = await Data().getDoctorById();
    setState(() {
      _name.text = resp['nombre'];
      _mail.text = resp['correo'];
      _country.text = resp['id_pais'];
      name = resp['nombre'];
      mail = resp['correo'];
      loading = false;
    });
  }

  List countrys = [
    "Argentina",
    "Brasil",
    "Colombia",
    "México",
    "Perú",
    "Venezuela",
    "Bolivia",
    "Uruguay",
    "Paraguay",
    "Chile",
    "Costa Rica",
    "Ecuador",
    "El Salvador",
    "Guatemala",
    "Honduras",
    "Nicaragua",
    "Panamá",
    "República Dominicana"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: loading
            ? Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getAppBarWithLogo(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage('./assets/icons/img_usuario.png'),
                            width: 100,
                            height: 100,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 129, 171, 1.0)),
                                ),
                                Text(
                                  mail,
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove('save');
                                    Navigator.pushNamed(context, '/initial');
                                  },
                                  child: Text(
                                    t.singOffTitleProfilePage,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(240, 162, 51, 1.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquare(t.hintTextNameProfilePage, _name),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquare(
                          t.hintTextEmailProfilePage, _mail),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquareC(
                          t.hintTextCountryProfilePage, getTextCountry()),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquare(
                          t.hintTextPasswordProfilePage, _passwordR),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquare(
                          t.hintTextNewPasswordProfilePage, _passwordN),
                      SizedBox(
                        height: 20,
                      ),
                      getTextFieldModelSquare(
                          t.hintTextConfirmPasswordProfilePage, _passwordC),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              if (_passwordN.text == _passwordC.text &&
                                  _passwordN.text != '' &&
                                  _passwordN.text.isNotEmpty) {
                                await Data().updateDoctor(
                                    _name.text,
                                    _mail.text,
                                    _passwordR.text,
                                    _passwordN.text,
                                    _country.text,
                                    true);
                              } else {
                                await Data().updateDoctor(
                                    _name.text,
                                    _mail.text,
                                    _passwordR.text,
                                    _passwordN.text,
                                    _country.text,
                                    false);
                              }
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
                                  t.buttonTitleProfilePage,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        actions: [
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              t.cancelarButtomModal,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            color: Colors.blueAccent,
                                          ),
                                          RaisedButton(
                                            onPressed: () async {
                                              await Data().deleteAccount();
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  "/initial",
                                                  (route) => false);
                                            },
                                            child: Text(
                                              t.calculatorConfirmSendCalendarModalButton,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red,
                                          ),
                                        ],
                                        title: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                                children: [
                                              TextSpan(
                                                  text: t
                                                      .modalDeleteAccountText1),
                                              TextSpan(
                                                  text:
                                                      t.modalDeleteAccountText2,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                  text:
                                                      t.modalDeleteAccountText3)
                                            ])));
                                  });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Text(
                                  t.cancelarButtom,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Center(
                      //   child: RaisedButton(
                      //     color: Colors.red,
                      //     onPressed: () {
                      //       showDialog(
                      //           context: context,
                      //           builder: (context) {
                      //             return AlertDialog(
                      //                 actions: [
                      //                   RaisedButton(
                      //                     onPressed: () {},
                      //                     child: Text(
                      //                       "CANCELAR",
                      //                       style: TextStyle(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.bold,
                      //                           color: Colors.white),
                      //                     ),
                      //                     color: Colors.blueAccent,
                      //                   ),
                      //                   RaisedButton(
                      //                     onPressed: () {},
                      //                     child: Text(
                      //                       "ACEPTAR",
                      //                       style: TextStyle(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.bold,
                      //                           color: Colors.white),
                      //                     ),
                      //                     color: Colors.red,
                      //                   ),
                      //                 ],
                      //                 title: RichText(
                      //                     text: TextSpan(
                      //                         style: TextStyle(
                      //                             color: Colors.black,
                      //                             fontSize: 18),
                      //                         children: [
                      //                       TextSpan(text: "Estás a punto de "),
                      //                       TextSpan(
                      //                           text: " eliminar tu cuenta, ",
                      //                           style: TextStyle(
                      //                               fontWeight:
                      //                                   FontWeight.bold)),
                      //                       TextSpan(
                      //                           text:
                      //                               "¿estás seguro?. Este cambio no puede ser revertido")
                      //                     ])));
                      //           });
                      //     },
                      //     child: Text(
                      //       "Eliminar cuenta",
                      //       style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ));
  }

  getTextFieldModelSquare(text, controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 18),
          border: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 5))),
    );
  }

  getTextFieldModelSquareC(label, text) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Color.fromARGB(255, 167, 167, 168))),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTextCountry() {
    for (var i = 0; i < countrys.length; i++) {
      print(countrys[i]);
      if (i == (int.parse(_country.text) - 1)) {
        return countrys[i];
      }
    }
  }
}

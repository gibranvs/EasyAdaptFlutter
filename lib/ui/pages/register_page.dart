import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          "Crear cuenta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 118, 159, 1.0),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(56, 118, 159, 1.0),
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
                const Text(
                  "BIENVENIDO!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(56, 118, 159, 1.0),
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Crea tu cuenta con un solo paso, introduce tus datos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Nombre completo',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                const SizedBox(
                  height: 18,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                const SizedBox(
                  height: 18,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                const SizedBox(
                  height: 18,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Confirmar contraseña',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                const SizedBox(
                  height: 18,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'País',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                const SizedBox(
                  height: 18,
                ),
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'CURP/DNI',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    SizedBox(
                      width: 1,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Acepto',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ' términos y condiciones',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/login');
                            },
                          style: TextStyle(
                              color: Color.fromRGBO(56, 118, 159, 1.0),
                              fontWeight: FontWeight.bold))
                    ])),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromRGBO(129, 181, 178, 1.0)),
              child: Center(
                child: Text(
                  "Crear cuenta",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

import 'package:easy_adapt/ui/widgets/appbar_with_logo.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarWithLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_pin,
                  size: 80,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Probando doc",
                        style: TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 129, 171, 1.0)),
                      ),
                      Text(
                        "Probando doc",
                        style: TextStyle(fontSize: 19, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/initial');
                        },
                        child: Text(
                          "Cerrar sesión",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 162, 51, 1.0)),
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
            getTextFieldModelSquare('Nombre'),
            SizedBox(
              height: 20,
            ),
            getTextFieldModelSquare('Correo'),
            SizedBox(
              height: 20,
            ),
            getTextFieldModelSquare('País'),
            SizedBox(
              height: 20,
            ),
            getTextFieldModelSquare('Contraseña actual'),
            SizedBox(
              height: 20,
            ),
            getTextFieldModelSquare('Nueva contraseña'),
            SizedBox(
              height: 20,
            ),
            getTextFieldModelSquare('Confirmar contraseña'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(129, 181, 178, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Center(
                      child: Text(
                        'Cambiar',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

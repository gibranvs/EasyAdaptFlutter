import 'package:easy_adapt/ui/pages/calculadora/widgets/product_model_confir.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmPacientResult extends StatefulWidget {
  ConfirmPacientResult({Key? key}) : super(key: key);

  @override
  State<ConfirmPacientResult> createState() => _ConfirmPacientResultState();
}

class _ConfirmPacientResultState extends State<ConfirmPacientResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarWithLogosWidget(Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(56, 118, 159, 1.0),
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Confirmar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromRGBO(56, 118, 159, 1.0),
                  ),
                )
              ],
            )),
            patients_card_model(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Prescripción ojo derecho',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            productModelConfirm(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Prescripción ojo izquierdo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            productModelConfirm(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  launch(
                      'https://calendar.google.com/calendar/u/0/r/eventedit?dates=20220226T033000/20220226T040000&ctz=America/Calcutta&location&text=Easy adapt - paciente Nombre del paciente&details=');
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(129, 181, 178, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: Text(
                      'GUARDAR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  patients_card_model() {
    return Container(
        width: double.infinity,
        child: Card(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image(
                image: AssetImage('./assets/icons/img_usuario.png'),
                width: 80,
                height: 80,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Probando doc",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 129, 171, 1.0)),
                    ),
                    Text(
                      "Probando doc",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

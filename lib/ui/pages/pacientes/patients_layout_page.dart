import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/material.dart';

class PatientsLayoutPage extends StatefulWidget {
  PatientsLayoutPage({Key? key}) : super(key: key);

  @override
  State<PatientsLayoutPage> createState() => _PatientsLayoutPageState();
}

class _PatientsLayoutPageState extends State<PatientsLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getAppBarWithLogos(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: 250,
                  height: 40,
                  child: getTextFieldModelSquare('Buscar por nombre....'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              patients_card_model(),
              SizedBox(
                height: 20,
              ),
              patients_card_model(),
              SizedBox(
                height: 20,
              ),
              patients_card_model(),
              SizedBox(
                height: 20,
              ),
              patients_card_model(),
              SizedBox(
                height: 20,
              ),
              patients_card_model(),
              SizedBox(
                height: 20,
              ),
              patients_card_model()
            ],
          ),
        ],
      ),
    );
  }

  Container patients_card_model() {
    return Container(
        width: double.infinity,
        child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(
                "Paciente prueba",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 129, 171, 1.0)),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Probando doc",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Probando doc",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 52,
                    color: Color.fromRGBO(240, 162, 51, 1.0),
                  ),
                ],
              ),
            )));
  }
}

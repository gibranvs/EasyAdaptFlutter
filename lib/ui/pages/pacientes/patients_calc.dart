import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_widget_and_logos.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/material.dart';

class PatientsCalc extends StatefulWidget {
  var t;
  PatientsCalc({Key? key, required this.t}) : super(key: key);

  @override
  State<PatientsCalc> createState() => _PatientsCalcState();
}

class _PatientsCalcState extends State<PatientsCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
                child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getAppBarWithWidgetAndLogos(IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      iconSize: 35,
                      color: Color.fromRGBO(56, 118, 159, 1.0),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        width: 250,
                        height: 40,
                        child: getTextFieldModelSquare('Buscar por nombre....'),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Para realizar cualquier cálculo debes seleccionar un paciente o crear uno nuevo para guardar los resultados.',
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 139, 132, 132)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                    patients_card_model(),
                    SizedBox(
                      height: 20,
                    ),
                    patients_card_model(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ],
            )),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/patients/add-patient');
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(129, 181, 178, 1.0)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      )),
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
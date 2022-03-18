import 'package:flutter/material.dart';

class TutorialesPage extends StatefulWidget {
  TutorialesPage({Key? key}) : super(key: key);

  @override
  State<TutorialesPage> createState() => _TutorialesPageState();
}

class _TutorialesPageState extends State<TutorialesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Tutoriales",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 129, 171, 1.0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet(),
            _model_tarjet()
          ],
        ),
      ),
    );
  }

  Padding _model_tarjet() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 60,
            color: Colors.blueGrey,
          ),
          Flexible(
              child: Center(
                  child: Text(
            "Eleccion del lente de contacto",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 129, 171, 1.0)),
          )))
        ],
      ),
    );
  }
}

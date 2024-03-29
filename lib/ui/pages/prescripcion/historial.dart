import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/state/patient_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logo_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class HistorialPage extends StatefulWidget {
  HistorialPage({Key? key}) : super(key: key);

  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              getAppBarWithWidgetAndLogoAndText(
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 35,
                    color: Color.fromRGBO(56, 118, 159, 1.0),
                  ),
                  t.prescriptionBack),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('./assets/icons/img_usuario.png'),
                    width: 90,
                    height: 90,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Provider.of<PatientState>(context)
                              .patient['nombre']
                              .toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 129, 171, 1.0)),
                        ),
                        Text(
                          Provider.of<PatientState>(context)
                              .patient['correo']
                              .toString(),
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.prescriptionTitle1,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[700],
              ),
              FutureBuilder(
                future: Data().getPrescription(
                    Provider.of<PatientState>(context).patient['id']),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        ...List.generate(
                            data.length,
                            (index) => model(
                                data[index]['fecha_prescripcion'],
                                data[index]['ojo'],
                                data[index]['valores'].toString().replaceAll("/ 0.00 x 0", "").replaceAll("/ 0 x 0", ""),
                                data[index]['producto']))
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column model(fecha, ojo, valores, producto) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    fecha.toString().split('-')[2],
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 129, 171, 1.0)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${DateTime.parse(fecha).month.toString()} ${DateTime.parse(fecha).year.toString()} ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 129, 171, 1.0)),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ojo == "0"
                        ? t.hisotirlaPrescriptionsEye1
                        : t.hisotirlaPrescriptionsEye2,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$valores - $producto',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500]),
                  ),
                ],
              ))
            ],
          ),
        ),
        Divider(
          color: Colors.grey[700],
        ),
      ],
    );
  }
}

import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:easy_adapt/ui/widgets/text_field_model-square.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

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
                  child: getTextFieldModelSquare(t.hintTextPatientsPage),
                ),
              ),
              FutureBuilder(
                future: Data().getPatients(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      children: List.generate(data.length, (index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            patients_card_model(data[index]['nombre'],
                                data[index]['telefono'], data[index]['correo']),
                          ],
                        );
                      }),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container patients_card_model(name, phone, mail) {
    return Container(
        width: double.infinity,
        child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(
                name.toString(),
                style: TextStyle(
                    fontSize: 16,
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
                    mail.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    phone.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('./assets/icons/usuario.png'),
                    size: 52,
                    color: Color.fromRGBO(240, 162, 51, 1.0),
                  ),
                ],
              ),
            )));
  }
}

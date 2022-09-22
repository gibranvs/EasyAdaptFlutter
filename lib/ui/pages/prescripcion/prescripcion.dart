import 'dart:math';

import 'package:easy_adapt/data/data.dart';
import 'package:easy_adapt/data/internal_data.dart';
import 'package:easy_adapt/state/menu_state.dart';
import 'package:easy_adapt/state/patient_state.dart';
import 'package:easy_adapt/state/result_state.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_text_and_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_widget_and_logos.dart';
import 'package:easy_adapt/ui/widgets/getAppBarWithWidgetAndLogosAndText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

class PrescripcionPage extends StatefulWidget {
  PrescripcionPage({Key? key}) : super(key: key);

  @override
  State<PrescripcionPage> createState() => _PrescripcionPageState();
}

class _PrescripcionPageState extends State<PrescripcionPage> {
  var dataR = {};
  var dataL = {};
  String imageR = '';
  String imageL = '';
  bool loading = true;
  @override
  void didChangeDependencies() {
    loadData();
    super.didChangeDependencies();
  }

  loadData() async {
    setState(() {
      loading = true;
    });
    var resp1 = await Data().getLastPrescription(
        Provider.of<PatientState>(context, listen: false).patient['id'], '0');
    var resp2 = await Data().getLastPrescription(
        Provider.of<PatientState>(context, listen: false).patient['id'], '1');
    setState(() {
      setState(() {
        dataR = resp1;
        dataL = resp2;
        loading = false;
      });
    });
    getProductImage(dataR['id_producto'].toString(), '0');
    getProductImage(dataL['id_producto'].toString(), '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getAppBarWithWidgetAndLogosAndText(
                IconButton(
                  onPressed: () {
                    Provider.of<MenuState>(context, listen: false)
                        .changeIndex(3);

                    Navigator.pushNamedAndRemoveUntil(
                        context, '/layout', (route) => false);
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  color: Color.fromRGBO(56, 118, 159, 1.0),
                ),
                t.prescriptionBack),
            loading == true
                ? Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.hisotirlaPrescriptionsEyeR,
                            style: TextStyle(
                                color: Color.fromARGB(255, 147, 144, 144),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          dataR['producto'].toString() != 'null'
                              ? _model(dataR, imageR)
                              : Container(),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            t.hisotirlaPrescriptionsEyeL,
                            style: TextStyle(
                                color: Color.fromARGB(255, 147, 144, 144),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          dataL['producto'].toString() != 'null'
                              ? _model(dataL, imageL)
                              : Container(),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            t.hisotirlaPrescriptionsEyeE,
                            style: TextStyle(
                                color: Color.fromARGB(255, 147, 144, 144),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            dataR['fecha_prescripcion'].toString() != 'null'
                                ? dataR['fecha_prescripcion'].toString()
                                : dataL['fecha_prescripcion'].toString() !=
                                        'null'
                                    ? dataR['fecha_prescripcion'].toString()
                                    : "",
                            style: TextStyle(
                              color: Color.fromARGB(255, 147, 144, 144),
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/historial');
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(129, 181, 178, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: Text(
                      t.prescriptionButton1,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Row _model(dataG, image) {
    print(image);
    return Row(
      children: [
        Container(
          width: 130,
          height: 100,
          child: image != '' ? Image.asset(image) : Container(),
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
              dataG['producto'].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 19, 72, 165)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              dataG['valores'].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 147, 144, 144)),
            )
          ],
        ))
      ],
    );
  }

  getProductImage(id, eye) {
    print(id);
    print(eye);

    List responseSpherico = productsSphereEn;
    responseSpherico.forEach((element) {
      if (element['idPS'] == id) {
        if (eye == '0') {
          setState(() {
            imageR = element['imagePS'];
          });
        } else {
          setState(() {
            imageL = element['imagePS'];
          });
        }
      }
    });
    List responseToric = productsToricosEn;
    responseToric.forEach((element) {
      if (element['idPS'] == id) {
        print('no llego');

        if (eye == '0') {
          setState(() {
            imageR = element['imagePS'];
          });
        } else {
          setState(() {
            imageL = element['imagePS'];
          });
        }
      }
    });
    List responseMulti = productsMultifocalEn;
    responseMulti.forEach((element) {
      if (element['idPS'] == id) {
        if (eye == '0') {
          print("este es el elemento mi brother $element");
          setState(() {
            imageR = element['imagePS'];
          });
        } else {
          setState(() {
            imageL = element['imagePS'];
          });
        }
      }
    });

    // falta productos

    // List response = productsSphereEn;
    // responseSpherico.forEach((element) {
    //   if (element['idPS'] == id) {
    //     if (eye == '0') {
    //       setState(() {
    //         imageR = element['imagePS'];
    //       });
    //     } else {
    //       setState(() {
    //         imageL = element['imagePS'];
    //       });
    //     }
    //   }
    // });
  }
}

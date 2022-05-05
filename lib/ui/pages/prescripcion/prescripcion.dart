import 'package:easy_adapt/ui/widgets/appbar_with_text_and_logos.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_widget_and_logos.dart';
import 'package:easy_adapt/ui/widgets/getAppBarWithWidgetAndLogosAndText.dart';
import 'package:flutter/material.dart';
import '/../i18n/strings.g.dart';

class PrescripcionPage extends StatefulWidget {
  PrescripcionPage({Key? key}) : super(key: key);

  @override
  State<PrescripcionPage> createState() => _PrescripcionPageState();
}

class _PrescripcionPageState extends State<PrescripcionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            getAppBarWithWidgetAndLogosAndText(
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: 35,
                  color: Color.fromRGBO(56, 118, 159, 1.0),
                ),
                t.prescriptionBack),
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
}
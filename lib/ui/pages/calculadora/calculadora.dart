import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/material.dart';

class CalcInitialPage extends StatefulWidget {
  CalcInitialPage({Key? key}) : super(key: key);

  @override
  State<CalcInitialPage> createState() => _CalcInitialPageState();
}

class _CalcInitialPageState extends State<CalcInitialPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getAppBarWithLogos(),
            calc_card_model(),
            calc_card_model(),
            calc_card_model(),
            calc_card_model(),
          ],
        ),
      ),
    );
  }

  calc_card_model() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/calc/patients');
      },
      child: Container(
          width: double.infinity,
          height: 90,
          child: Card(
              elevation: 2.0,
              child: ListTile(
                title: Center(
                  child: Text(
                    'Example',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromARGB(255, 5, 53, 92)),
                  ),
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate_rounded,
                      size: 52,
                      color: Color.fromRGBO(240, 162, 51, 1.0),
                    ),
                  ],
                ),
              ))),
    );
  }
}

import 'package:easy_adapt/state/calculator_state.dart';
import 'package:easy_adapt/ui/widgets/appbar_with_logos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

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
            calc_card_model(t.calc1Title, 1),
            calc_card_model(t.calc2Title, 2),
            calc_card_model(t.calc3Title, 3),
            calc_card_model(t.calc4Title, 4),
          ],
        ),
      ),
    );
  }

  calc_card_model(text, index) {
    return GestureDetector(
      onTap: () {
        Provider.of<CalculatorState>(context, listen: false).changeIndex(index);
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
                    text,
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
                    ImageIcon(
                      AssetImage('./assets/icons/calculadora.png'),
                      size: 40,
                      color: Color.fromRGBO(240, 162, 51, 1.0),
                    )
                  ],
                ),
              ))),
    );
  }
}

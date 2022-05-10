import 'package:easy_adapt/helpers/func.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';

sphericalCalculatorRight(context) {
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataRight['data'] as Map;
  var resultRoundR = 0.0;

  var tempEsphereR = ((double.parse(dataProvider['Sphere'] ?? "0.0")) /
      (1 -
          (double.parse(dataProvider['Sphere'] ?? "0.0") *
              (double.parse(dataProvider['Sphere'] ?? "0.0") / 1000))));

  if (tempEsphereR > 6) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphere', tempEsphereR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('distance', dataProvider['Distance'] ?? "0");
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphereRound', resultRoundR);
  // Navigator.pushNamed(context, '/calc/results/esferico');
  print(Provider.of<CalculatorTotalState>(context, listen: false).dataRight);
}

sphericalCalculatorLeft(context) {
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataLeft['data'] as Map;
  var resultRoundR = 0.0;

  var tempEsphereR = ((double.parse(dataProvider['Sphere'] ?? "0.0")) /
      (1 -
          (double.parse(dataProvider['Sphere'] ?? "0.0") *
              (double.parse(dataProvider['Sphere'] ?? "0.0") / 1000))));

  if (tempEsphereR > 6) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphere', tempEsphereR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('distance', dataProvider['Distance'] ?? "0");
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphereRound', resultRoundR);
  // Navigator.pushNamed(context, '/calc/results/esferico');
  print(Provider.of<CalculatorTotalState>(context, listen: false).dataLeft);
}

import 'package:easy_adapt/helpers/func.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';

multifocalCalculatorRight(context) {
  var sphereFinal = 0.0;
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataRight['data'] as Map;

  var sphereEquivalent = (double.parse(dataProvider['Sphere'] ?? "0") +
      ((double.parse(dataProvider['Cylinder'] ?? "0") / 2)));

  if (sphereEquivalent < 4 && sphereEquivalent > -4) {
    sphereFinal = sphereEquivalent;
  } else {
    var tempEsphereR = (sphereEquivalent /
        (1 -
            (sphereEquivalent *
                (double.parse(dataProvider['Distance'] ?? "0.0") / 1000))));
    sphereFinal = tempEsphereR;
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('sphere', sphereEquivalent);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphereRound', sphereFinal);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('dominante', dataProvider['Dominante']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('add', dataProvider['Add']);
}

multifocalCalculatorLeft(context) {
  var resultRoundR = 0.0;

  var sphereFinal = 0.0;
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataLeft['data'] as Map;

  var sphereEquivalent = (double.parse(dataProvider['Sphere'] ?? "0") +
      ((double.parse(dataProvider['Cylinder'] ?? "0") / 2)));

  if (sphereEquivalent < 4 && sphereEquivalent > -4) {
    sphereFinal = sphereEquivalent;
  } else {
    var tempEsphereR = (sphereEquivalent /
        (1 -
            (sphereEquivalent *
                (double.parse(dataProvider['Distance'] ?? "0.0") / 1000))));
    if (tempEsphereR > 6) {
      resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
      sphereFinal = resultRoundR;
    } else {
      resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
      sphereFinal = resultRoundR;
    }
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('sphere', sphereEquivalent);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphereRound', sphereFinal);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('dominante', dataProvider['Dominante']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('add', dataProvider['Add']);
}

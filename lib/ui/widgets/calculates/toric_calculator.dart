import 'package:easy_adapt/helpers/func.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';

toricCalculatorRight(context) {
  var resultRoundR = 0.0;
  var resultRoundCIR = 0.0;
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataRight['data'] as Map;
  var tempEsphereR = ((double.parse(dataProvider['Sphere'] ?? "0")) /
      (1 -
          (double.parse(dataProvider['Sphere'] ?? "0") *
              (int.parse(dataProvider['Distance'] ?? "0") / 1000))));

  var tempcylinderR = ((double.parse(dataProvider['Sphere'] ?? "0") +
              (double.parse(dataProvider['Cylinder'] ?? "0"))) /
          ((1 -
              (((int.parse(dataProvider['Distance'] ?? "0")) / 1000) *
                  (double.parse(dataProvider['Sphere'] ?? "0") +
                      double.parse(dataProvider['Cylinder'] ?? "0"))))) -
      tempEsphereR);

  if (tempEsphereR > 6) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }

  resultRoundCIR = FuncCalculators().roundCI(tempcylinderR);

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphere', tempEsphereR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('distance', dataProvider['Distance'] ?? '0');

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('cylinder', tempcylinderR);
  Provider.of<CalculatorTotalState>(context, listen: false).changeResponseRight(
      'axis',
      dataProvider['Axis'] != null
          ? (double.parse(dataProvider['Axis'])).toString()
          : "0");
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphereRound', resultRoundR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('cylinderRound', resultRoundCIR);
}

toricCalculatorLeft(context) {
  var resultRoundR = 0.0;
  var resultRoundCIR = 0.0;
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataLeft['data'] as Map;
  var tempEsphereR = ((double.parse(dataProvider['Sphere'] ?? "0")) /
      (1 -
          (double.parse(dataProvider['Sphere'] ?? "0") *
              (int.parse(dataProvider['Distance'] ?? "0") / 1000))));

  var tempcylinderR = ((double.parse(dataProvider['Sphere'] ?? "0") +
              (double.parse(dataProvider['Cylinder'] ?? "0"))) /
          ((1 -
              (((int.parse(dataProvider['Distance'] ?? "0")) / 1000) *
                  (double.parse(dataProvider['Sphere'] ?? "0") +
                      double.parse(dataProvider['Cylinder'] ?? "0"))))) -
      tempEsphereR);

  if (tempEsphereR > 6) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }

  resultRoundCIR = FuncCalculators().roundCI(tempcylinderR);

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphere', tempEsphereR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('distance', dataProvider['Distance'] ?? '0');

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinder', tempcylinderR);
  Provider.of<CalculatorTotalState>(context, listen: false).changeResponseLeft(
      'axis',
      dataProvider['Axis'] != null
          ? (double.parse(dataProvider['Axis'])).toString()
          : "0");
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphereRound', resultRoundR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinderRound', resultRoundCIR);
}

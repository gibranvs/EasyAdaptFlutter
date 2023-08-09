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
  int eje=0;

  if (tempEsphereR > (0-6)) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }
  if(dataProvider['Axis'] != null){
    eje=int.parse(dataProvider['Axis']);
    if( (eje % 10) != 0){
      eje = eje-5;
    }
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
      eje.toString());
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
  int eje=0;

  if (tempEsphereR > (0-6)) {
    resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
  } else {
    resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
  }

  resultRoundCIR = FuncCalculators().roundCI(tempcylinderR);

  if(dataProvider['Axis'] != null){
    eje=int.parse(dataProvider['Axis']);
    if( (eje % 10) != 0){
      eje = eje+5;
    }
  }

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphere', tempEsphereR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('distance', dataProvider['Distance'] ?? '0');

  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinder', tempcylinderR);
  Provider.of<CalculatorTotalState>(context, listen: false).changeResponseLeft(
      'axis',
     eje.toString() );
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphereRound', resultRoundR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinderRound', resultRoundCIR);
}

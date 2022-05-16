import 'package:easy_adapt/helpers/func.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';

monovisionlCalculatorRight(context) {
  var resultRoundCIR = 0.0;
  var tempcylinderR = 0.0;
  var spherePrevia = 0.0;
  var resultRoundR = 0.0;

  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataRight['data'] as Map;

  if (double.parse(dataProvider['Cylinder']) == 0) {
    var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
        .dataRight['data'] as Map;
    var sphereEquivalent = (double.parse(dataProvider['Sphere'] ?? "0") +
        ((double.parse(dataProvider['Cylinder'] ?? "0") / 2)));

    if (sphereEquivalent < 4 && sphereEquivalent > -4) {
    } else {
      var tempEsphereR = (sphereEquivalent / (1 - (sphereEquivalent * 0.012)));
      spherePrevia = tempEsphereR;

      if (tempEsphereR > 6) {
        resultRoundR = FuncCalculators().round25(tempEsphereR.toDouble());
      } else {
        resultRoundR = FuncCalculators().round50(tempEsphereR.toDouble());
      }
    }
  } else {
    // var tempEsphereR = (sphereEquivalent /
    //     (1 -
    //         (sphereEquivalent *
    //             (double.parse(dataProvider['Distance'] ?? "0.0") / 1000))));
    // sphereTempFinal = tempEsphereR;

    // if (tempEsphereR > 6) {
    //   sphereFinal = FuncCalculators().round25(tempEsphereR.toDouble());
    // } else {
    //   sphereFinal = FuncCalculators().round50(tempEsphereR.toDouble());
    // }
    // tempcylinderR = ((double.parse(dataProvider['Sphere'] ?? "0") +
    //             (double.parse(dataProvider['Cylinder'] ?? "0"))) /
    //         ((1 -
    //             (((int.parse(dataProvider['Distance'] ?? "0")) / 1000) *
    //                 (double.parse(dataProvider['Sphere'] ?? "0") +
    //                     double.parse(dataProvider['Cylinder'] ?? "0"))))) -
    //     tempEsphereR);
    // Provider.of<CalculatorTotalState>(context, listen: false)
    //     .changeResponseRight('typeCalc', 'Toric');
    // resultRoundCIR = FuncCalculators().roundCI(tempcylinderR);
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('sphere', spherePrevia);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('esphereRound', resultRoundR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('cylinderRound', resultRoundCIR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('dominante', dataProvider['Dominante']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('add', dataProvider['Add']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('cylinder', tempcylinderR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseRight('distance', dataProvider['Distance'] ?? '0');
}

monovisionCalculatorLeft(context) {
  var resultRoundCIR = 0.0;
  var tempcylinderR = 0.0;
  var sphereFinal = 0.0;
  var dataProvider = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataLeft['data'] as Map;

  var sphereEquivalent = (double.parse(dataProvider['Sphere'] ?? "0") +
      ((double.parse(dataProvider['Cylinder'] ?? "0") / 2)));

  if (double.parse(dataProvider['Cylinder']).toInt() == 0) {
    var tempEsphereR = (sphereEquivalent /
        (1 -
            (sphereEquivalent *
                (double.parse(dataProvider['Distance'] ?? "0.0") / 1000))));
    if (tempEsphereR > 6) {
      sphereFinal = FuncCalculators().round25(tempEsphereR.toDouble());
    } else {
      sphereFinal = FuncCalculators().round50(tempEsphereR.toDouble());
    }
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('typeCalc', 'Spherical');
  } else {
    var tempEsphereR = (sphereEquivalent /
        (1 -
            (sphereEquivalent *
                (double.parse(dataProvider['Distance'] ?? "0.0") / 1000))));
    if (tempEsphereR > 6) {
      sphereFinal = FuncCalculators().round25(tempEsphereR.toDouble());
    } else {
      sphereFinal = FuncCalculators().round50(tempEsphereR.toDouble());
    }
    tempcylinderR = ((double.parse(dataProvider['Sphere'] ?? "0") +
                (double.parse(dataProvider['Cylinder'] ?? "0"))) /
            ((1 -
                (((int.parse(dataProvider['Distance'] ?? "0")) / 1000) *
                    (double.parse(dataProvider['Sphere'] ?? "0") +
                        double.parse(dataProvider['Cylinder'] ?? "0"))))) -
        tempEsphereR);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('typeCalc', 'Toric');
    resultRoundCIR = FuncCalculators().roundCI(tempcylinderR);
  }
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('sphere', sphereEquivalent);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('esphereRound', sphereFinal);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinderRound', resultRoundCIR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('dominante', dataProvider['Dominante']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('add', dataProvider['Add']);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('cylinder', tempcylinderR);
  Provider.of<CalculatorTotalState>(context, listen: false)
      .changeResponseLeft('distance', dataProvider['Distance'] ?? '0');
}

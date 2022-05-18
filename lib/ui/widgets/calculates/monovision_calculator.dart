import 'package:easy_adapt/helpers/func.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';
import '/../i18n/strings.g.dart';

monovisionlCalculatorRight(context) {
  var dataProviderR = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataRight['data'] as Map;

  if (dataProviderR['Dominante'] == t.calculatorEsfericos.eyeRight) {
    var esferaDom = double.parse(dataProviderR['Sphere'] ?? "0.0") /
        (1 -
            (int.parse(dataProviderR['Distance'] ?? "0") / 1000) *
                double.parse(dataProviderR['Sphere'] ?? "0.0"));
    var sumaDom = double.parse(dataProviderR['Sphere'] ?? "0.0") +
        double.parse(dataProviderR['Cylinder'] ?? "0.0");
    var resDominante = sumaDom /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * sumaDom);
    var cilindroDominante = resDominante - esferaDom;
    if (cilindroDominante != 0) {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Toric');
    } else {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Spherical');
    }
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('sphere', esferaDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('esphereRound', esferaDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('cylinderRound', cilindroDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('dominante', dataProviderR['Dominante']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('add', dataProviderR['Add']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('cylinder', cilindroDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('distance', dataProviderR['Distance'] ?? '0');
  } else {
    var esferaND = double.parse(dataProviderR['Sphere'] ?? "0.0") +
        int.parse(dataProviderR['Add'] ?? "0");
    var esferaNoDom = esferaND /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * esferaND);

    var sumaNoDom = esferaND + double.parse(dataProviderR['Cylinder'] ?? "0.0");
    var resNoDominante = sumaNoDom /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * sumaNoDom);
    var cilindroNoDominante = resNoDominante - esferaNoDom;
    if (cilindroNoDominante != 0.0) {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Toric');
      print('derechi');
    } else {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Spherical');
    }
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('sphere', esferaNoDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('esphereRound', esferaNoDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('cylinderRound', cilindroNoDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('dominante', dataProviderR['Dominante']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('add', dataProviderR['Add']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('cylinder', cilindroNoDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseRight('distance', dataProviderR['Distance'] ?? '0');
  }
}

monovisionCalculatorLeft(context) {
  var dataProviderR = Provider.of<CalculatorTotalState>(context, listen: false)
      .dataLeft['data'] as Map;

  if (dataProviderR['Dominante'] == t.calculatorEsfericos.eyeRight) {
    var esferaDom = double.parse(dataProviderR['Sphere'] ?? "0.0") /
        (1 -
            (int.parse(dataProviderR['Distance'] ?? "0") / 1000) *
                double.parse(dataProviderR['Sphere'] ?? "0.0"));
    var sumaDom = double.parse(dataProviderR['Sphere'] ?? "0.0") +
        double.parse(dataProviderR['Cylinder'] ?? "0.0");
    var resDominante = sumaDom /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * sumaDom);
    var cilindroDominante = resDominante - esferaDom;
    if (cilindroDominante != 0) {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Toric');
    } else {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Spherical');
    }
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('sphere', esferaDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('esphereRound', esferaDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('cylinderRound', cilindroDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('dominante', dataProviderR['Dominante']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('add', dataProviderR['Add']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('cylinder', cilindroDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('distance', dataProviderR['Distance'] ?? '0');
  } else {
    var esferaND = double.parse(dataProviderR['Sphere'] ?? "0.0") +
        int.parse(dataProviderR['Add'] ?? "0");
    var esferaNoDom = esferaND /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * esferaND);

    var sumaNoDom = esferaND + double.parse(dataProviderR['Cylinder'] ?? "0.0");
    var resNoDominante = sumaNoDom /
        (1 - (int.parse(dataProviderR['Distance'] ?? "0") / 1000) * sumaNoDom);
    var cilindroNoDominante = resNoDominante - esferaNoDom;
    if (cilindroNoDominante != 0.0) {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Toric');
    } else {
      Provider.of<CalculatorTotalState>(context, listen: false)
          .changeResponseRight('typeCalc', 'Spherical');
    }

    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('sphere', esferaNoDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('esphereRound', esferaNoDom);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('cylinderRound', cilindroNoDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('dominante', dataProviderR['Dominante']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('add', dataProviderR['Add']);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('cylinder', cilindroNoDominante);
    Provider.of<CalculatorTotalState>(context, listen: false)
        .changeResponseLeft('distance', dataProviderR['Distance'] ?? '0');
  }
}

import 'package:easy_adapt/data/internal_data.dart';
import 'package:easy_adapt/state/calculator_total_state.dart';
import 'package:provider/provider.dart';

loadProductsSphere(context, code, condition) {
  List dataProducts = [];
  switch (code) {
    case 'es':
      productsSphereEs.forEach((element) {
        if (double.parse(element['maxPS']) > condition &&
            double.parse(element['minPS']) < condition) {
          dataProducts.add(element);
        }
      });
      break;
    case 'en':
      if (condition != null) {
        productsSphereEn.forEach((element) {
          if (double.parse(element['maxPS']) > condition &&
              double.parse(element['minPS']) < condition) {
            dataProducts.add(element);
          }
        });
      }
      break;
    case 'pt':
      productsSpherePt.forEach((element) {
        if (double.parse(element['maxPS']) > condition &&
            double.parse(element['minPS']) < condition) {
          dataProducts.add(element);
        }
      });
      break;
    default:
  }
  return dataProducts;
}

import 'package:easy_adapt/ui/pages/calculadora/widgets/bottom_shet_esferico.dart';
import 'package:easy_adapt/ui/pages/calculadora/widgets/bottom_shet_toricos.dart';
import 'package:flutter/material.dart';

productModel(index, context, name, desc, path, sphere, distance, cylinder, axis,
    right, onYes) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () async {
        switch (index) {
          case 1:
            getBottomShetEsferico()
                .get(context, name, path, sphere, distance, onYes, right);
            break;
          case 2:
            getBottomShetToricos()
                .get(context, name, path, sphere, cylinder, axis);
            break;
          case 3:
            getBottomShetEsferico()
                .get(context, name, path, '', '', onYes, right);
            break;
          default:
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Image.asset(path),
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 9, 61, 150)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            desc,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

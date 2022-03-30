import 'package:easy_adapt/ui/pages/calculadora/widgets/bottom_shet_esferico.dart';
import 'package:flutter/material.dart';

productModel(index, context) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () async {
        switch (index) {
          case 1:
            getBottomShetEsferico().get(context);
            break;
          case 2:
            getBottomShetEsferico().get(context);
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
            color: Colors.lightBlueAccent,
          ),
          Text(
            'Soflens 69',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 9, 61, 150)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Descripcion del producto',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

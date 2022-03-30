import 'package:easy_adapt/ui/pages/calculadora/widgets/bottom_shet_esferico.dart';
import 'package:flutter/material.dart';

productModelConfirm() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(10.0),
    child: GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 100,
            color: Colors.lightBlueAccent,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Soflens 69',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 9, 61, 150)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Descripcion del producto',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ],
          ))
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';

productModel() {
  return Container(
    margin: EdgeInsets.all(10.0),
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
  );
}

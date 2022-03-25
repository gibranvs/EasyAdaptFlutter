import 'package:flutter/material.dart';

getAppBarCalculators(context) {
  return Container(
    width: double.infinity,
    height: 200,
    color: Colors.black,
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child:
              Image(image: AssetImage('./assets/calculators/bl_lentillas.png')),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          iconSize: 35,
          color: Color.fromRGBO(56, 118, 159, 1.0),
        )
      ],
    ),
  );
}

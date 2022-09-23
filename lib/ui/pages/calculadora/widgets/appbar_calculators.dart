import 'package:easy_adapt/state/result_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Provider.of<ResultState>(context, listen: false).clearPresc();
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

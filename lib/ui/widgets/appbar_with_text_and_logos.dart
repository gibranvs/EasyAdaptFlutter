import 'package:flutter/material.dart';

getAppBarWithTextAndLogos(text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "BAUSCH + LOMB",
          style: TextStyle(
              color: Color.fromRGBO(102, 133, 153, 1.0),
              fontSize: 16,
              fontWeight: FontWeight.w900),
        ),
        Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 129, 171, 1.0)),
                ),
              ),
              Image.asset(
                './assets/logo.png',
                width: 80,
                height: 80,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

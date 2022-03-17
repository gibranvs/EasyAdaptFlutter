import 'package:flutter/material.dart';

getAppBarWithLogo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "BAUSCH + LOMB",
      style: TextStyle(
          color: Color.fromRGBO(102, 133, 153, 1.0),
          fontSize: 16,
          fontWeight: FontWeight.w900),
    ),
  );
}

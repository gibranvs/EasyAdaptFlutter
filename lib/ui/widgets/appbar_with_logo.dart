import 'package:flutter/material.dart';

getAppBarWithLogo() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Image(
      image: AssetImage('./assets/icons/bausch_lomb.png'),
      width: 144,
    ),
  );
}

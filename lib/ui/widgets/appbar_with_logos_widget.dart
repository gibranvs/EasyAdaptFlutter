import 'package:flutter/material.dart';

getAppBarWithLogosWidget(widget) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('./assets/icons/bausch_lomb.png'),
          width: 144,
        ),
        Container(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget,
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

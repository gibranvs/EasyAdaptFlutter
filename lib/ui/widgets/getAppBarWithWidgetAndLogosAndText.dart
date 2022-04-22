import 'package:flutter/material.dart';

getAppBarWithWidgetAndLogosAndText(widget, text) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5), child: widget),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 129, 171, 1.0)),
                  ),
                ],
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

import 'package:flutter/material.dart';

getTextFieldModelSquare(text) {
  return TextField(
    decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(fontSize: 18),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 5))),
  );
}

getTextFieldModelSquareLoginEmail(text, controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(fontSize: 18),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 5))),
  );
}

getTextFieldModelSquareLoginPassword(text, controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(fontSize: 18),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 5))),
  );
}

getTextFieldModelSquareWhite(text) {
  return TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 5))),
  );
}

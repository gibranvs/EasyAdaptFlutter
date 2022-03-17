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

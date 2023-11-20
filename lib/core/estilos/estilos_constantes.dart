import 'package:flutter/material.dart';

const kTextField = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.normal,
);

var kTextFieldDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintText: '',
    hintStyle: kTextField,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ));

const kBackgroundBase = BoxDecoration(
  color: Color.fromRGBO(29, 76, 97, 1),
  gradient: LinearGradient(
      colors: [Color.fromRGBO(45, 149, 142, 1), Color.fromRGBO(29, 76, 97, 1)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter),
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

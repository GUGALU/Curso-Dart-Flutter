// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants.dart';
import '../views/calculadora_view.dart';

void main() {
  runApp(const IMC());
}

class IMC extends StatelessWidget {
  const IMC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora IMC",
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: mainColor,
        ),
        scaffoldBackgroundColor: mainColor,
      ),
      home: Calculadora(),
    );
  }
}

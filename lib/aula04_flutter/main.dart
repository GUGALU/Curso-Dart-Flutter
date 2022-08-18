// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(Aula());
}

class Aula extends StatelessWidget {
  const Aula({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Principal(),
    );
  }
}

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Colors.red,
              ),
              Text(
                "Teste",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 72,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            "Teste",
            style: TextStyle(
              color: Colors.white,
              fontSize: 72,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

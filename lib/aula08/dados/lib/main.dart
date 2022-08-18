import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dados(),
    );
  }
}
class Dados extends StatefulWidget {
  const Dados({Key? key}) : super(key: key);

  @override
  State<Dados> createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  int dado1 = 3;
  int dado2 = 6;

  void mudarDados() {
    setState(() {
      dado1 = Random().nextInt(6) + 1;
      dado2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Dados"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: mudarDados,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset("assets/dice$dado1.png"),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Image.asset("assets/dice$dado2.png"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

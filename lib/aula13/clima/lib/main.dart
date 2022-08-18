import 'package:clima/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(Clima());
}

class Clima extends StatelessWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

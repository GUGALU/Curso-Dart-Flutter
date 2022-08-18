import 'package:flutter/material.dart';
import 'package:gifinder/screens/navegacao.dart';

void main() {
  runApp(Gifinder());
}

class Gifinder extends StatelessWidget {
  const Gifinder({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Navegacao(),
    );
  }
}

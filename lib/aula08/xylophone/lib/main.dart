import 'package:audioplayers/audioplayers.dart';
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
      home: Xilofone(),
    );
  }
}

class Xilofone extends StatelessWidget {
  Xilofone({Key? key}) : super(key: key);

  var player = AudioCache();

  Widget makeNote(int notaNum, Color cor) {
    return Expanded(
      child: InkWell(
        onTap: () => player.play("note$notaNum.wav"),
        child: Container(
          color: cor,
        ),
      ),
    );
  }

  List<Widget> getNotes() {
    var widgetsLista = <Widget>[];

    for (int i = 1; i < 8; i++) {
      widgetsLista.add(
        makeNote(i, Colors.primaries[i * 2]),
      );
    }

    return widgetsLista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: getNotes(),
      ),
    );
  }
}

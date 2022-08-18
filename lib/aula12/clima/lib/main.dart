import 'dart:io';
import 'package:clima/services/api.dart';
import 'package:clima/services/localizacao.dart';
import 'package:clima/services/network.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(Clima());
}

class Clima extends StatelessWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void testarPosicao() async {
    var localizacao = Localizacao();
    await localizacao.getLocalizacao();

    print(localizacao.latitude);
    print(localizacao.longitude);

    var requisicao =
        await Network("https://viacep.com.br/ws/01001000/json/").makeRequest();
    print(requisicao);
  }

  @override
  Widget build(BuildContext context) {
    testarPosicao();
    return Scaffold(
      body: Container(),
    );
  }
}

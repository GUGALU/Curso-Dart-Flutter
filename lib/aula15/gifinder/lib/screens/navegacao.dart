import 'package:flutter/material.dart';
import 'package:gifinder/screens/favoritos.dart';
import 'package:gifinder/screens/home.dart';

class Navegacao extends StatefulWidget {
  const Navegacao({Key? key}) : super(key: key);

  @override
  State<Navegacao> createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  int index = 0;

  var telas = <Widget>[
    Home(),
    Favoritos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: telas[index]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (posicao) {
          setState(() {
            index = posicao;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          )
        ],
      ),
    );
  }
}

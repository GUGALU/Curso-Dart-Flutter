import 'package:clima/services/api.dart';
import 'package:clima/services/network.dart';
import 'package:clima/services/tempo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget mostrarTempo(int temperatura, String emoji, String descricao) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconButton(
          icon: Icon(
            Icons.near_me,
            size: 50,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "$temperatura° $emoji",
            style: TextStyle(fontSize: 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            descricao,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 60),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.dstATop,
            ),
            image: NetworkImage(
                "https://coisascriativas.b-cdn.net/wp-content/uploads/2019/09/paisagem-Montanhas-e-lago.jpg"),
          ),
        ),
        child: SafeArea(
          child: FutureBuilder(
            future: Tempo.getTempo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  var dados = snapshot.data as API;
                  return mostrarTempo(
                    dados.temperatura,
                    Tempo.getEmoji(dados.condicao),
                    Tempo.getDescricao(dados.temperatura) +
                        " em " +
                        dados.cidade,
                  );
                } else {
                  return mostrarTempo(
                      0, "❌", "Não foi possível carregar dados");
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

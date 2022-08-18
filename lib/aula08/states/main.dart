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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = "Rafael";

  Color corTexto = Colors.green;

  Widget container = Container();

  void mudarNome() {
    setState(() {
      nome = "João";
    });
  }

  void mudarCor() {
    setState(() {
      corTexto = Colors.red;
    });
  }

  void mostrarContainer() {
    setState(() {
      container = Container(
        width: 200,
        height: 200,
        color: Colors.blue,
      );
    });
  }

  void mostrarTudo() {
    mudarCor();
    mudarNome();
    mostrarContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nome,
              style: TextStyle(
                fontSize: 48,
                color: corTexto,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                mostrarContainer();
                mudarCor();
                mudarNome();
                print("funcao anonima");
              },
              child: Text("Mudar nome"),
            ),
            container,
          ],
        ),
      ),
    );
  }
}
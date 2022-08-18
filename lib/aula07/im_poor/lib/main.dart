import 'package:flutter/material.dart';

void main() {
  runApp(ImPoor());
}

class ImPoor extends StatelessWidget {
  const ImPoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Im Poor",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.lightGreen[100],
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I am poor"),
      ),
      body: Center(
        child: InkWell(
          onTap: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Alerta"),
              content: Text("Alerta descrição"),
              actions: [
                TextButton(
                  child: Text("Não"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  child: Text("Sim"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          child: Image(
            width: 200,
            image: AssetImage("assets/933316.png"),
          ),
        ),
      ),
    );
  }
}

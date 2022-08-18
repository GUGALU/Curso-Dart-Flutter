// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo Exemplo",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: WidgetsBasicos2(),
    );
  }
}

class WidgetsBasicos extends StatelessWidget {
  const WidgetsBasicos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Chato",
                style: TextStyle(fontSize: 62),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Chato",
                style: TextStyle(fontSize: 62),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.yellow,
                  child: Text(
                    "Exemplo",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Text(
                    "Exemplo",
                    style: TextStyle(fontSize: 42),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WidgetsBasicos2 extends StatelessWidget {
  const WidgetsBasicos2({Key? key}) : super(key: key);

  void printOla() {
    print("Olá");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.headset_rounded,
                size: 42,
                color: Colors.pink,
              ),
              Icon(
                Icons.music_note,
                size: 42,
                color: Colors.green,
              ),
              Icon(
                Icons.umbrella,
                size: 42,
                color: Colors.blue,
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              "Download",
            ),
            onPressed: printOla,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.red[300],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: 10,
              ),
            ),
            // child: Image(
            //   width: 200,
            //   image: NetworkImage(
            //       'https://img.r7.com/images/top-100-hora-7-errado-google-24092021021515245?dimensions=771x420&no_crop=true'),
            // ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
                width: 10,
              ),
            ),
            child: Image(
              width: 150,
              image: AssetImage('assets/coruja.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

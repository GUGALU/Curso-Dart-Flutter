// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Zen Loop",
      ),
      home: MW3(),
    );
  }
}

class MW3 extends StatelessWidget {
  const MW3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.blue,
              child: Text(
                "Texto",
                style: TextStyle(fontSize: 64),
              ),
            ),
            Card(
              elevation: 10,
              child: ListTile(
                leading: Icon(
                  Icons.album,
                  size: 48,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 32,
                  ),
                  onPressed: () => null,
                ),
                title: Text("Titulo do ListTile"),
                subtitle: Text("Subtitulo do ListTile"),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red,
              child: Text(
                "JG",
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: "Zen Loop",
                ),
              ),
            ),
            Card(
              color: Colors.blue[100],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[700],
                  child: Icon(
                    Icons.person,
                    size: 28,
                  ),
                ),
                title: Text(
                  "Widget of the Week",
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
                subtitle: Text(
                  "#54",
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
                trailing: Icon(
                  Icons.drag_handle,
                  color: Colors.blue[900],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

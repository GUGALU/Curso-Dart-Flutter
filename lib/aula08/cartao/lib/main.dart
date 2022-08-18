// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MiCard());
}

class MiCard extends StatelessWidget {
  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi Card",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
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
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.lightGreen[300],
              backgroundImage: AssetImage("assets/foto.png"),
            ),
            Text(
              "Joao Gabriel",
              style: TextStyle(fontFamily: "Macondo"),
            ),
            Text(
              "Estudante",
              style: TextStyle(
                fontFamily: "Koulen",
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            SizedBox(
              width: 300,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.lightGreen,
                ),
                title: Text(
                  "+55 44 99999-9999",
                  style: TextStyle(color: Colors.lightGreen),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 15),
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.lightGreen,
                ),
                title: Text(
                  "email_exemplo@provedor.com",
                  style: TextStyle(color: Colors.lightGreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

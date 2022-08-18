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
        colorScheme: ColorScheme.dark(),
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.purple,
            fontSize: 42,
          ),
        ),
      ),
      home: MaterialWidgets(),
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
                Icons.mouse,
                size: 52,
                color: Colors.black,
              ),
              Icon(
                Icons.lock,
                size: 52,
                color: Colors.grey,
              ),
              Icon(
                Icons.keyboard,
                size: 52,
                color: Colors.red,
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              "Download",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 56,
              ),
            ),
            onPressed: printOla,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.red[300],
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text("Pessoa"),
            onPressed: printOla,
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
              image: AssetImage('assets/c2.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialWidgets extends StatelessWidget {
  const MaterialWidgets({Key? key}) : super(key: key);

  void printFloating() {
    print("Este é um Floating Action Button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text("Titulo"),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Text("Drawer", ),
            InkWell(
              onTap: () => null,
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text("Inbox"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
        onPressed: printFloating,
      ),
      body: Center(
        child: Text(
          "Teste",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

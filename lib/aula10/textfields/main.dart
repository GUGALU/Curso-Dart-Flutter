import 'package:flutter/material.dart';

void main() {
  runApp(InputUsuario());
}

class InputUsuario extends StatelessWidget {
  const InputUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Input Usuario",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String login = "";

  String email = "";

  String senha = "";

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => login = value,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text("Login"),
                border: OutlineInputBorder(),
                hintText: "Digite seu Login",
                helperText: "Ex. rafael",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              onChanged: (value) => email = value,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
                hintText: "Digite seu Email",
                helperText: "Ex. rafael@gmail.com",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              onChanged: (value) => senha = value,
              keyboardType: TextInputType.name,
              obscureText: isHidden,
              decoration: InputDecoration(
                  label: Text("Senha"),
                  border: OutlineInputBorder(),
                  hintText: "Digite seu Senha",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                  )),
            ),
            ElevatedButton(
              child: Text("Mostrar login"),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Informação Login"),
                  content: Column(
                    children: [
                      Text(login),
                      Text(email),
                      Text(senha),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

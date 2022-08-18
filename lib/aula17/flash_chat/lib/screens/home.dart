import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  String email = "";
  String senha = "";

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: "logo",
                        child: Image.asset(
                          "assets/logo.png",
                          height: 80,
                        ),
                      ),
                      Text(
                        "Flash Chat",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  RoundedTextField(
                    textoAjuda: "Digite seu email",
                    onChanged: (value) => email = value,
                  ),
                  const SizedBox(height: 10),
                  RoundedTextField(
                    textoAjuda: "Digite sua senha",
                    onChanged: (value) => senha = value,
                    esconderTexto: true,
                  ),
                  const SizedBox(height: 30),
                  RoundedButton(
                    texto: "Login",
                    cor: Colors.lightBlueAccent,
                    onPressed: () async {
                      try {
                        var resultado = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: senha,
                        );

                        if (resultado.user != null) {
                          Navigator.of(context).pushNamed("chat");
                        }
                      } catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err.toString()),
                          ),
                        );
                      }
                    },
                  ),
                  RoundedButton(
                    texto: "Cadastrar-se",
                    cor: Colors.lightBlue,
                    onPressed: () =>
                        Navigator.of(context).pushNamed("cadastro"),
                  )
                ],
              ),
            ),
            animation.value != 0
                ? Container(
                    color: Colors.white.withOpacity(animation.value),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    "assets/logo.png",
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              RoundedTextField(
                textoAjuda: "Digite seu email",
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 16),
              RoundedTextField(
                textoAjuda: "Digite sua senha",
                onChanged: (value) => senha = value,
                esconderTexto: true,
              ),
              const SizedBox(height: 40),
              RoundedButton(
                texto: "Cadastrar-se",
                cor: Colors.lightBlue,
                onPressed: () async {
                  try {
                    var resultado = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

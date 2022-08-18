import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
                onChanged: (value) => (null),
              ),
              const SizedBox(height: 16),
              RoundedTextField(
                textoAjuda: "Digite sua senha",
                onChanged: (value) => (null),
                esconderTexto: true,
              ),
              const SizedBox(height: 40),
              RoundedButton(
                texto: "Cadastrar-se",
                cor: Colors.lightBlue,
                onPressed: () => null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

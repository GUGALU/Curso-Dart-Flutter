import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  RoundedTextField({
    required this.textoAjuda,
    required this.onChanged,
    this.esconderTexto = false,
  });

  String textoAjuda;
  bool esconderTexto;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: esconderTexto,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        hintText: textoAjuda,
      ),
    );
  }
}

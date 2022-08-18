import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.texto,
    required this.onPressed,
    required this.cor,
  });

  String texto;
  Function()? onPressed;
  Color cor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        color: cor,
        borderRadius: BorderRadius.circular(300),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

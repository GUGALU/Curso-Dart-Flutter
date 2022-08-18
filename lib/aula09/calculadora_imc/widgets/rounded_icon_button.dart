import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({required this.icon, required this.onPressed});

  IconData icon;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      fillColor: iconButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      constraints: const BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
    );
  }
}

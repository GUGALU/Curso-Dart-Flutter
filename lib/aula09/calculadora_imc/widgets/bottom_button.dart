import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.label, required this.onPressed});

  String label;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 60,
      color: highlightColor,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

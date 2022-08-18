import 'package:flutter/material.dart';
import '../constants.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.child, this.cor, this.onPressed});

  Widget child;
  Function()? onPressed;
  Color? cor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cor ?? cardColor,
      margin: EdgeInsets.all(5),
      child: InkWell(
        child: child,
        onTap: onPressed,
      ),
    );
  }
}

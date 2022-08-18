import 'package:flutter/material.dart';
import '../constants.dart';

class IconLabel extends StatelessWidget {
  IconLabel({required this.label, required this.icon});

  String label;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        Text(
          label,
          style: labelStyle,
        ),
      ],
    );
  }
}

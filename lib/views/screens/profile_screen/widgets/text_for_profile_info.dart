import 'package:flutter/material.dart';

class TextForProfie extends StatelessWidget {
  final String title;
  final Color color;
  const TextForProfie({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}


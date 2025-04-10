import 'package:flutter/material.dart';

class FactWidget extends StatelessWidget {
  const FactWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(0.2),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

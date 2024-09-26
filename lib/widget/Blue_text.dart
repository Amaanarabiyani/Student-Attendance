import 'package:flutter/material.dart';

class BlueText extends StatelessWidget {
  final String text;
  const BlueText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

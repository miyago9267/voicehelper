import 'package:flutter/material.dart';

class RecognizedTextDisplay extends StatelessWidget {
  final String text;
  const RecognizedTextDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}

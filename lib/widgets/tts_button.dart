import 'package:flutter/material.dart';

class TtsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const TtsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("說你好"),
    );
  }
}

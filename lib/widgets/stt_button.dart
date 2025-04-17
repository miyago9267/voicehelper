import 'package:flutter/material.dart';

class SttButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SttButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("🎤 開始說話"),
    );
  }
}

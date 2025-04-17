import 'package:flutter/material.dart';
import '../widgets/tts_button.dart';
import '../widgets/stt_button.dart';
import '../widgets/recognized_text_display.dart';
import '../services/voice_service.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({super.key});

  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  final VoiceService _voiceService = VoiceService();
  bool isListening = false;
  String recognizedText = '';

  void onTextRecognized(String text) {
    setState(() {
      recognizedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("語音範例")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TtsButton(onPressed: () {
              _voiceService.speak("你好");
            }),
            const SizedBox(height: 20),
            SttButton(onPressed: () async {
              if (!isListening) {
                bool ready = await _voiceService.initialize();
                if (!ready) return;
                setState(() => isListening = true);
                await _voiceService.startListening((text) {
                  setState(() => recognizedText = text);
                });
              } else {
                await _voiceService.stopListening();
                setState(() => isListening = false);
              }
            }),
            const SizedBox(height: 20),
            RecognizedTextDisplay(text: recognizedText),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceService {
  final FlutterTts _tts = FlutterTts();
  final SpeechToText _speech = SpeechToText();

  bool isListening = false;

  Future<void> speak(String text) async {
    await _tts.setLanguage("zh-TW");
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }

  Future<bool> initialize() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
      if (!status.isGranted) return false;
    }
    return await _speech.initialize();
  }

  Future<void> startListening(Function(String) onResult) async {
    await _speech.listen(
      localeId: "zh-TW",
      onResult: (result) => onResult(result.recognizedWords),
    );
    isListening = true;
  }

  Future<void> stopListening() async {
    await _speech.stop();
    isListening = false;
  }
}

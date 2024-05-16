import 'dart:async';

import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  static Gemini gemini = Gemini.instance;

  static Future<String> getGeminiResponse(String? ingredient) async {
    final String question =
        'Tolong berikan alternatif bahan masakan dari $ingredient, tolong berikan jawaban yang tidak bertele-tele dan langsung ke inti jawabannya dan jawab menggunakan bahasa inggris, tolong jangan gunakan ikon *. dan jika $ingredient bukanlah sebuah bahan masakan, maka jawab "maaf $ingredient bukanlah bahan masakan" dalam bahasa inggris, dan jika $ingredient adalah sebuah bahan masakan, maka berikan alternatif bahan masakan dari $ingredient ';
    Completer<String> completer = Completer<String>();
    gemini.streamGenerateContent(question).listen((event) {
      String response = event.content?.parts?.fold('',
              (previousValue, element) => '$previousValue${element.text}') ??
          '';
      completer.complete(response);
    });
    return completer.future;
  }
}

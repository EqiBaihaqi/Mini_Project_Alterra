import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:your_comfort_food/model/service/gemini_ai_service.dart';

class AlternateIngredientViewModel extends ChangeNotifier {
  String? _response;
  String? get response => _response;

  bool? _isLoading;
  bool? get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void getGeminiResponse(String question) async {
    _response = null;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await GeminiService.getGeminiResponse(question);
      _response = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

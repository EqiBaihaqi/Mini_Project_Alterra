import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:your_comfort_food/model/service/gemini_ai_service.dart';

class AlternateIngredientViewModel extends ChangeNotifier {
  String? _response;
  String? get response => _response;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
      if (e.response?.statusCode == 404) {
        _errorMessage = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorMessage =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorMessage =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorMessage =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorMessage = "Something went wronng, please try again later";
      }

      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

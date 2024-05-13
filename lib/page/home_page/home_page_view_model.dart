import 'package:flutter/material.dart';
import 'package:your_comfort_food/model/random_recipes_response.dart';
import 'package:your_comfort_food/model/service/recipe_service.dart';
import 'package:dio/dio.dart';

enum RecipeType {
  all,
  vegan,
  dairyFree,
}

class HomePageViewModel extends ChangeNotifier {
  RandomRecipeResponse _randomRecipeResponse = RandomRecipeResponse();
  RandomRecipeResponse get randomRecipeResponse => _randomRecipeResponse;

  bool _isLoadingRandomRecipe = false;
  bool get isLoadingRandomRecipe => _isLoadingRandomRecipe;

  String? _errorRandomRecipe;
  String? get errorRandomRecipe => _errorRandomRecipe;

  void getRandomRecipe() async {
    _isLoadingRandomRecipe = true;
    _randomRecipeResponse = RandomRecipeResponse();
    _errorRandomRecipe = null;
    notifyListeners();

    try {
      final response = await RecipeService.getRandomRecipe();

      _randomRecipeResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorRandomRecipe =
            "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorRandomRecipe =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorRandomRecipe =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorRandomRecipe =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorRandomRecipe = "Something went wronng, please try again later";
      }
    } finally {
      _isLoadingRandomRecipe = false;
      notifyListeners();
    }
  }

  RandomRecipeResponse _veganRecipeResponse = RandomRecipeResponse();
  RandomRecipeResponse get veganRecipeResponse => _veganRecipeResponse;

  bool _isLoadingVeganRecipe = false;
  bool get isLoadingVeganRecipe => _isLoadingVeganRecipe;

  String? _errorVeganRecipe;
  String? get errorVeganRecipe => _errorVeganRecipe;

  void getVeganRecipe() async {
    _isLoadingVeganRecipe = true;
    _veganRecipeResponse = RandomRecipeResponse();
    _errorVeganRecipe = null;

    notifyListeners();

    try {
      final response = await RecipeService.getVeganRecipe();

      _veganRecipeResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorVeganRecipe =
            "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorVeganRecipe =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorVeganRecipe =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorVeganRecipe =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorVeganRecipe = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingVeganRecipe = false;
      notifyListeners();
    }
  }

  RandomRecipeResponse _dairyFreeRecipeResponse = RandomRecipeResponse();
  RandomRecipeResponse get dairyFreeRecipeResponse => _dairyFreeRecipeResponse;

  bool _isLoadingDairyFreeRecipe = false;
  bool get isLoadingDairyFreeRecipe => _isLoadingDairyFreeRecipe;

  String? _errorDairyFreeRecipe;
  String? get errorDairyFreeRecipe => _errorDairyFreeRecipe;

  void getDairyFreeRecipe() async {
    _isLoadingDairyFreeRecipe = true;
    _dairyFreeRecipeResponse = RandomRecipeResponse();
    _errorDairyFreeRecipe = null;

    notifyListeners();

    try {
      final response = await RecipeService.getDairyFreeRecipe();

      _dairyFreeRecipeResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorDairyFreeRecipe =
            "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorDairyFreeRecipe =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorDairyFreeRecipe =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorDairyFreeRecipe =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorDairyFreeRecipe = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingDairyFreeRecipe = false;
      notifyListeners();
    }
  }

  RecipeType _selectRecipe = RecipeType.all;
  RecipeType get selectRecipe => _selectRecipe;

  bool _isAllClicked = true;
  bool get isAllClicked => _isAllClicked;
  void setAllRecipe() {
    _selectRecipe = RecipeType.all;
    _isAllClicked = true;
    _isDairyClicked = false;
    _isVeganClicked = false;
    notifyListeners();
  }

  bool _isVeganClicked = false;
  bool get isVeganClicked => _isVeganClicked;
  void setVeganRecipe() {
    _selectRecipe = RecipeType.vegan;
    _isVeganClicked = true;
    _isAllClicked = false;
    _isDairyClicked = false;
    notifyListeners();
  }

  bool _isDairyClicked = false;
  bool get isDairyClicked => _isDairyClicked;
  void setDairyRecipe() {
    _selectRecipe = RecipeType.dairyFree;
    _isDairyClicked = true;
    _isVeganClicked = false;
    _isAllClicked = false;
    notifyListeners();
  }

  void refreshRecipe() {
    if (_isAllClicked) {
      getRandomRecipe();
      notifyListeners();
    } else if (_isVeganClicked) {
      getVeganRecipe();
      notifyListeners();
    } else if (_isDairyClicked) {
      getDairyFreeRecipe();
      notifyListeners();
    }

    notifyListeners();
  }
}

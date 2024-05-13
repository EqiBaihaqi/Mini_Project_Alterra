import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_comfort_food/model/detail_recipe_response.dart';
import 'package:your_comfort_food/model/equipment_response.dart';
import 'package:your_comfort_food/model/nutrition_recipe_response.dart';
import 'package:your_comfort_food/model/service/detail_recipe_service.dart';
import 'package:your_comfort_food/model/service/equipment_service.dart';
import 'package:your_comfort_food/model/service/nutrition_recipe.dart';

enum DetailRecipeType {
  description,
  instruction,
  ingredients,
}

class DetailRecipeViewModel extends ChangeNotifier {
  DetailRecipeResponse? _detailRecipeResponse;
  DetailRecipeResponse? get detailRecipeResponse => _detailRecipeResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorDetail;
  String? get errorDetail => _errorDetail;

  void getDetailRecipe({required int? idRecipe}) async {
    _detailRecipeResponse = DetailRecipeResponse();
    _isLoading = true;
    _errorDetail = null;
    notifyListeners();

    try {
      final response =
          await DetailRecipeService.getDetailRecipe(idRecipe: idRecipe);

      _detailRecipeResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorDetail = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorDetail =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorDetail =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorDetail =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorDetail = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoading = false;
    }
  }

  DetailRecipeType _selectType = DetailRecipeType.description;
  DetailRecipeType get selectType => _selectType;

  bool _isDescription = true;
  bool get isDescription => _isDescription;

  void setDescription() {
    _selectType = DetailRecipeType.description;
    _isDescription = true;
    _isIngredients = false;
    _isInstruction = false;
    notifyListeners();
  }

  bool _isInstruction = false;
  bool get isInstruction => _isInstruction;

  void setInstruction() {
    _selectType = DetailRecipeType.instruction;
    _isDescription = false;
    _isIngredients = false;
    _isInstruction = true;
    notifyListeners();
  }

  bool _isIngredients = false;
  bool get isIngredients => _isIngredients;

  void setIngredients() {
    _selectType = DetailRecipeType.ingredients;
    _isIngredients = true;
    _isDescription = false;
    _isInstruction = false;
    notifyListeners();
  }

  void resetType() {
    _selectType = DetailRecipeType.description;
    _isIngredients = false;
    _isInstruction = false;
    _isDescription = true;
    notifyListeners();
  }

  NutritionRecipeResponse _nutritionRecipeResponse = NutritionRecipeResponse();
  NutritionRecipeResponse get nutritionRecipeResponse =>
      _nutritionRecipeResponse;

  void getNutrition(int? idRecipe) async {
    _isLoading = true;
    _nutritionRecipeResponse = NutritionRecipeResponse();
    _errorDetail = null;
    notifyListeners();
    try {
      final response = await NutritionRecipeService.getNutrition(idRecipe);

      _nutritionRecipeResponse = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorDetail = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorDetail =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorDetail =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorDetail =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorDetail = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  EquipmentResponse _equipmentResponse = EquipmentResponse();
  EquipmentResponse get equipmentResponse => _equipmentResponse;

  void getEquipment(int? idRecipe) async {
    _isLoading = true;
    _errorDetail = null;
    _equipmentResponse = EquipmentResponse();
    notifyListeners();
    try {
      final response = await EquipmentService.getNutrition(idRecipe);

      _equipmentResponse = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _errorDetail = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorDetail =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorDetail =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorDetail =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorDetail = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

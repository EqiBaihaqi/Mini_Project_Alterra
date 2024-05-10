import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_comfort_food/model/detail_recipe_response.dart';
import 'package:your_comfort_food/model/nutrition_recipe_response.dart';
import 'package:your_comfort_food/model/service/detail_recipe_service.dart';
import 'package:your_comfort_food/model/service/nutrition_recipe_service.dart';



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
      throw e.toString();
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

  NutritionRecipeResponse _nutritionRecipeResponse = NutritionRecipeResponse();
  NutritionRecipeResponse get nutritionRecipeResponse =>
      _nutritionRecipeResponse;

  bool _isLoadingNutrition = false;
  bool get isLoadingNutrition => _isLoadingNutrition;

  String? _errorNutrtition;
  String? get errorNutrition => _errorNutrtition;
  void getNutrition(int? idRecipe) async {
    _isLoadingNutrition = false;
    _errorNutrtition = null;
    notifyListeners();
    try {
      final response = await NutritionsRecipeService.getNutrition(idRecipe);
      _nutritionRecipeResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorNutrtition = e.toString();
      notifyListeners();
    } finally {
      _isLoadingNutrition = false;
    }
  }

  
}

import 'package:dio/dio.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/model/nutrition_recipe_response.dart';

class NutritionsRecipeService {
  static Dio dio = Dio();

  static Future<NutritionRecipeResponse> getNutrition(int? idRecipe) async {
    try {
      final response = await dio.get(
        'https://api.spoonacular.com/recipes/$idRecipe/nutritionWidget.json',
        options: Options(headers: {"Content-Type": "application/json"}),
        queryParameters: {"apiKey": apiKey, 'id': idRecipe},
      );
      return NutritionRecipeResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

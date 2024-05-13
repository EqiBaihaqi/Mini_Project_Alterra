import 'package:dio/dio.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/model/random_recipes_response.dart';

class RecipeService {
  static Dio dio = Dio();
  static int number = 15;
  static Future<RandomRecipeResponse> getRandomRecipe() async {
    final response = await dio.get(
      baseUrlRandomRecipe,
      options: Options(headers: {"Content-Type": "application/json"}),
      queryParameters: {
        "apiKey": apiKey,
        'number': number,
      },
    );
    return RandomRecipeResponse.fromJson(response.data);
  }

  static Future<RandomRecipeResponse> getVeganRecipe() async {
    final response = await dio.get(baseUrlRandomRecipe,
        options: Options(headers: {"Content-Type": "application/json"}),
        queryParameters: {
          "apiKey": apiKey,
          'number': number,
          'include-tags': 'vegan',
        });
    return RandomRecipeResponse.fromJson(response.data);
  }

  static Future<RandomRecipeResponse> getDairyFreeRecipe() async {
    final response = await dio.get(baseUrlRandomRecipe,
        options: Options(headers: {"Content-Type": "application/json"}),
        queryParameters: {
          'apiKey': apiKey,
          'number': number,
          'include-tags': 'dairy-free'
        });
    return RandomRecipeResponse.fromJson(response.data);
  }
}

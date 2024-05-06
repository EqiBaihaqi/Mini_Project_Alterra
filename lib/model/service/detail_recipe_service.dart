import 'package:dio/dio.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/model/detail_recipe_response.dart';

class DetailRecipeService {
  static Dio dio = Dio();

  static Future<DetailRecipeResponse> getDetailRecipe(int idRecipe) async {
    try {
      final response = await dio
          .get('https://api.spoonacular.com/recipes/$idRecipe/information',
              options: Options(
                headers: {'Content-Type': 'application/json'},
              ),
              queryParameters: {
            "apiKey": apiKey,
          });
      return DetailRecipeResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

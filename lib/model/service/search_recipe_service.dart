import 'package:dio/dio.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/model/search_recipes_response.dart';

class ServiceSearch {
  static Dio dio = Dio();

  static Future<SearchRecipesResponse> getSearchRecipe(String query) async {
    try {
      final response = await dio.get(baseUrlSearchRecipe,
          options: Options(
            headers: {"Content-Type": "application/json"},
          ),
          queryParameters: {"apiKey": apiKey, "query": query, "number": 25});

      return SearchRecipesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

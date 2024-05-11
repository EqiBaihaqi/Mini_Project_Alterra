import 'package:dio/dio.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/model/equipment_response.dart';


class EquipmentService {
  static Dio dio = Dio();

  static Future<EquipmentResponse> getNutrition(int? idRecipe) async {
    final response = await dio.get(
      'https://api.spoonacular.com/recipes/$idRecipe/equipmentWidget.json',
      options: Options(headers: {"Content-Type": "application/json"}),
      queryParameters: {
        "apiKey": apiKey,
        'id': idRecipe,
      },
    );
    return EquipmentResponse.fromJson(response.data);
  }
}

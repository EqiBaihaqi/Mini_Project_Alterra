import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SPOONACULAR_API_KEY')
  static const apiKey = _Env.apiKey;   
}

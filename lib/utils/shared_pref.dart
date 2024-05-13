import 'package:shared_preferences/shared_preferences.dart';

String _keyUsername = 'Username';
String _keyPassword = 'Password';

class SharedPrefLogin {
  static void saveUsername({required String username}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyUsername, username);
  }

  static Future<String?> getUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString(_keyUsername);
    return token;
  }

  static void savePassword({required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyPassword, password);
  }

  static void removeAllKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}





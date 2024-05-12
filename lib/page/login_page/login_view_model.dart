import 'package:flutter/material.dart';
import 'package:your_comfort_food/utils/shared_pref.dart';

class LoginPageViewModel extends ChangeNotifier {
  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;

  void toggleObsecure() {
    _obsecureText = !obsecureText;
    notifyListeners();
  }

  String? _userName;
  String? get userName => _userName;

  void getUsername() async {
    _userName = await SharedPrefLogin.getUsername();
    notifyListeners();
  }

  void logOut() {
    SharedPrefLogin.removeAllKey();
    notifyListeners();
  }
}

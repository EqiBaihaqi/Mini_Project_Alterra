import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/home.dart';
import 'package:your_comfort_food/page/login_page/login_view_model.dart';
import 'package:your_comfort_food/utils/shared_pref.dart';

// ignore: depend_on_referenced_packages
import 'package:colorful_iconify_flutter/icons/emojione.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _errorUsername;
  String? _errorPassword;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool validateForm() {
    return _errorUsername == null &&
        _errorPassword == null &&
        usernameController.text != '' &&
        passwordController.text != '';
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginPageViewModel>(context);
    return Scaffold(
      backgroundColor: ColorConstant.whitishGray,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 40,
                left: 30,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello,',
                  style: TextStyleConstant.poppinsRegular
                      .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, bottom: 57),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome Back!',
                  style:
                      TextStyleConstant.poppinsRegular.copyWith(fontSize: 20),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Iconify(
                Emojione.fork_and_knife_with_plate,
                size: 180,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyleConstant.poppinsRegular
                        .copyWith(color: ColorConstant.grayColor1),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12)),
                    errorText: _errorUsername),
                onChanged: (value) {
                  usernameController.text = value;
                  if (usernameController.text.isEmpty) {
                    _errorUsername = 'Username cannot be empty';
                  } else if (usernameController.text.length <= 2) {
                    _errorUsername =
                        'Username should at least have more than 2 letter';
                  } else {
                    _errorUsername = null;
                  }
                  setState(() {});
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    errorText: _errorPassword,
                    hintText: 'Password',
                    hintStyle: TextStyleConstant.poppinsRegular
                        .copyWith(color: ColorConstant.grayColor1),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(12)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        provider.toggleObsecure();
                      },
                      child: Icon(
                          provider.obsecureText ? Icons.lock : Icons.lock_open),
                    )),
                obscureText: provider.obsecureText,
                onChanged: (value) {
                  passwordController.text = value;
                  if (passwordController.text.isEmpty) {
                    _errorPassword = 'Password cannot be empty';
                  } else if (passwordController.text.length <= 2) {
                    _errorPassword =
                        'Password should at least have more than 2 letter';
                  } else {
                    _errorPassword = null;
                  }
                  setState(() {});
                },
              ),
            ),
            GestureDetector(
              onTap: validateForm()
                  ? () {
                      SharedPrefLogin.saveUsername(
                          username: usernameController.text);
                      SharedPrefLogin.savePassword(
                          password: passwordController.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false);
                    }
                  : null,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: validateForm()
                      ? ColorConstant.orangeColor
                      : ColorConstant.grayColor2,
                ),
                child: Text(
                  'Login',
                  style: TextStyleConstant.poppinsRegular.copyWith(
                      color: ColorConstant.whitishGray,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

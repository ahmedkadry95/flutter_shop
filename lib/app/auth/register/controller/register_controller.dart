import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/widgets/auth_snak_bar.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class RegisterController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  ApiServices apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  register(BuildContext context) async {
    await apiServices.registerUser(
      email: email.text,
      password: password.text,
      mobile: mobile.text,
      userName: userName.text,
      context: context,
      navigate: toLogin,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  validator(BuildContext context) async {
    if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(userNameSnackBar);
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emailSnackBar);
    } else if (mobile.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(mobileSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else {
      await register(context);
    }
  }

  toLogin() {
    navigation.navigateTo(RouteName.logIn);
  }
}

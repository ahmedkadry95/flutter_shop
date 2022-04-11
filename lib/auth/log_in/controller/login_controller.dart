import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/auth/register/view/register.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/api_services.dart';

class LogInController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  ApiServices apiServices = locator<ApiServices>();

  void login(context) async {
    await apiServices.login(
      email: email.text,
      password: password.text,
    );
  }


}

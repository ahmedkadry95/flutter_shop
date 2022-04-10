import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/api_services.dart';

class RegisterController extends BaseController {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  ApiServices apiServices = locator<ApiServices>();

  register() async {
    await apiServices.registerUser(
      email: email.text,
      password: password.text,
    );
  }
}

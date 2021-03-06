import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/widgets/auth_snak_bar.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class LogInController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();
  String? loginSuccess;
  final logInFormKey = GlobalKey<FormState>();

  void login(BuildContext context) async {
    if (logInFormKey.currentState!.validate()) {
      setState(ViewState.busy);
      loginSuccess = await apiServices.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (loginSuccess! == 'true') {
        navigation.navigateToAndClearStack(RouteName.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(failsAuthSnackBar);
      }
    }
    setState(ViewState.idel);
  }

  FormFieldValidator<String>? emailValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your email';
      }
      if (!isValidEmail(value.trim())) {
        return 'this email not valid';
      }
      return null;
    };
    return validator;
  }

  bool isValidEmail(String email) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }

  FormFieldValidator<String>? passwordValidator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {
        return 'enter your password';
      }

      return null;
    };
    return validator;
  }
}

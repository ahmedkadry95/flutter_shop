import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/widgets/auth_snak_bar.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/api_services.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class LogInController extends BaseController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var pref = locator<SharedPrefServices>();
  var apiServices = locator<ApiServices>();
  var navigation = locator<NavigationService>();
  bool? loginSuccess;

  logIn(BuildContext context) async {
    loginSuccess = await apiServices.login(
      email: email.text,
      password: password.text,
    );

    if (loginSuccess!) {
      await setIsLogIn(loginSuccess!);
      successLoginNavigation();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(failsAuthSnackBar);
    }

    print('loginSuccess is :  $loginSuccess');
  }

  setIsLogIn(bool value) async {
    await pref.saveBoolean('is_log_in', value);
  }

  successLoginNavigation() {
    navigation.navigateToAndClearStack(RouteName.home);
  }

  validator(BuildContext context) {
    if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(emailSnackBar);
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(passwordSnackBar);
    } else {
      logIn(context);
    }
  }
}


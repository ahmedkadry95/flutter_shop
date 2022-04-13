import 'dart:async';

import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class SplashController extends BaseController {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();

  bool? isLogIn;
  String? accountType;

  checkIsLogIn() async {
    isLogIn = await pref.getBoolean('is_log_in');
  }

  splashNavigation() async {
    if (!isLogIn!) {
      navigationTimer(RouteName.logIn);
    } else {
      navigationTimer(RouteName.home);
    }
  }

  void navigationTimer(String routName) {
    Timer(
      const Duration(seconds: 3),
      () {
        navigation.navigateTo(routName);
      },
    );
  }
}

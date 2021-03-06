import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class SplashController extends BaseController {
  CurrentSessionService currentSessionService = CurrentSessionService();
  var navigation = locator<NavigationService>();
  var user = FirebaseAuth.instance.currentUser;

  splashNavigation() async {
    if (user == null) {
      navigationTimer(RouteName.logIn);
    } else {
      navigationTimer(RouteName.home);
    }
  }

  void navigationTimer(String routName) {
    Timer(
      const Duration(seconds: 3),
      () {
        navigation.navigateToAndClearStack(routName);
      },
    );
  }

  getUserLocation() async {
    try {
      await currentSessionService.checkLocationServiceAndRequest();

    } catch (e) {
      print(e);
    }
  }
}

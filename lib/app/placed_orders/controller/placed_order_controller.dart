import 'dart:async';

import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class PlacedOrders extends BaseController {
  var navigation = locator<NavigationService>();

  void navigationToHome() {
    Timer(
      const Duration(seconds: 3),
      () {
        navigation.navigateToAndClearStack(RouteName.home);
      },
    );
  }
}

import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class SplashController extends BaseController {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();

  late bool isLogIn;

  checkIsLogIn() async {
    isLogIn = await pref.getBoolean('is_log_in');
    print(isLogIn);
  }

  splashNavigation() {
    if (!isLogIn) {
      navigation.navigateTo(RouteName.logIn);
    } else {
      navigation.navigateTo(RouteName.home);
    }
  }
}

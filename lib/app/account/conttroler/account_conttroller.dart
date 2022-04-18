import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class AccountController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await pref.saveBoolean('is_log_in', false);
      await pref.saveString('token', '');
      print('sign out success');
      navigation.navigateToAndClearStack(RouteName.splash);
    } catch (e) {
      print(e);
    }
  }

  getToken() async {
    await pref.getString('token');
  }

  getUserData(){

  }

}

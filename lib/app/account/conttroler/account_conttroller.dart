import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  CollectionReference userRef = FirebaseFirestore.instance.collection('user');
  var currentUser = FirebaseAuth.instance.currentUser;

  String? token;

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigation.navigateToAndClearStack(RouteName.splash);
    } catch (e) {
      print(e);
    }
  }

  getToken() async {
    token = await pref.getString('token');
    print(token);
  }

  getUserData() async {
    var userId = await currentUser?.uid;
    print('userId');
    print(userId);
  }
}

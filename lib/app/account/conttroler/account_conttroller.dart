import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class AccountController extends BaseController {
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance.currentUser;
  UserModel? userData;
  String? userId;
  String? userName = '';

  String? userEmail = '';

  String? userImage = '';

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigation.navigateToAndClearStack(RouteName.splash);
    } catch (e) {
      print(e);
    }
  }

  getUserData() async {
    userId = currentUser?.uid;
    DocumentSnapshot documentSnapshot = await userRef.doc(userId).get();
    print(documentSnapshot.data());
    userData = UserModel.fromJson(documentSnapshot.data());
    print('xxx');
    // print(userData);
    userName = userData?.userName;
    userEmail = userData?.email;
    print(userData?.address);
    print(userData?.imageUrl);
    print(userData?.imageUrl.runtimeType);
    setState(ViewState.idel);
  }
}

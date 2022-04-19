import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AccountController extends BaseController {
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance.currentUser;
  UserModel? userData;
  String? userId;
  String? token;

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigation.navigateToAndClearStack(RouteName.splash);
    } catch (e) {
      print(e);
    }
  }

  getUserData(context) async {
    userId = currentUser?.uid;
    DocumentSnapshot documentSnapshot = await userRef.doc(userId).get();
    userData = UserModel.fromJson(documentSnapshot.data());
    addAddress(context);
    print('userData.address');
    print(userData?.address);
  }

  addAddress(BuildContext context) {
    if (userData?.address == null) {
      AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.WARNING,
        body: const Center(
          child: Text(
            'Please add a delivery address',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        title: 'This is Ignored',
        desc: 'This is also Ignored',
        btnOkOnPress: () {
          navigation.navigateTo(RouteName.deliveryAddress);
        },
      ).show();
    }
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class CheckOutController extends BaseController {
  var navigation = locator<NavigationService>();
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance.currentUser;
  UserModel? user;
  TextEditingController promoController = TextEditingController();
  Map address = {
    'building_number': '',
    'street': '',
    'city': '',
  };

  List promoCodesList = [
    'discount10%',
    'discount15%',
    'discount20%',
  ];
  bool isValid = false;

  getUserData() async {
    String? userId = currentUser?.uid;
    DocumentSnapshot documentSnapshot = await userRef.doc(userId).get();
    var data = documentSnapshot.data();
    user = UserModel.fromJson(data);
    address = user!.address!;
    print(address);
    setState(ViewState.idel);
  }

  void checkPromoCode(context) {
    if (promoCodesList.contains(promoController.text)) {
      isValid = true;
      setState(ViewState.idel);
    } else {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.SCALE,
          title: 'Invalid',
          desc: 'this promo code is not exist ',
          btnCancelOnPress: () {
            promoController.clear();
            setState(ViewState.idel);
          }).show();
    }
  }
}

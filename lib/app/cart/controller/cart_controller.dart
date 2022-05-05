import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/utils/colors.dart';
import '../../check_out/view/check_out.dart';

class CartController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  List<ProductModel> cartList = [];
  List<double> sumList = [];
  double? total;

  var navigation = locator<NavigationService>();
  UserModel? user;
  bool isValid = false;
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

  getCart() async {
    var response = await userRef.doc(currentUser?.uid).collection('cart').get();
    var data = response.docs;
    for (var item in data) {
      cartList.add(ProductModel.fromJason(item.data()));
    }
    setState(ViewState.idel);
  }

  removeProduct(String productId) {
    userRef
        .doc(currentUser?.uid)
        .collection('cart')
        .doc(productId)
        .delete()
        .then((value) {
      print('product removed ');
      setState(ViewState.idel);
      cartList.removeWhere((element) => element.id == productId);
    });
    getTotalPrice();
  }

  void updateState() {
    setState(ViewState.idel);
  }

  double? getTotalPrice() {
    for (var i in cartList) {
      if (i.totalPrice! == 1) {
        sumList.add(i.price!);
      } else {
        sumList.add(i.totalPrice!);
      }
    }
    total = sumList.sum;
    print(total);
    sumList = [];
    return total;
  }

  SnackBar checkOutSnackBar = const SnackBar(
    content: Text('sorry no items in your cart to check out'),
    backgroundColor: errorColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  checkOut(context) {
    // getTotalPrice();
    // if (total == 0.0) {
    //   ScaffoldMessenger.of(context).showSnackBar(checkOutSnackBar);
    // } else {
    //   for (var element in cartList) {
    //     removeProduct(element.id!);
    //   }
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => CheckOutView(total),
    //     ),
    //   );
    // }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckOutView(total!),
      ),
    );
  }
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

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
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/utils/colors.dart';

class CartController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');
  List<ProductModel> cartList = [];
  List<double> sumList = [];
  double? total;
  double? totalAfterDiscount = 0.0;

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
    sumList = [];
    return total;
  }

  getTotalAfterDiscount() {
    if (isValid) {
      if (promoController.text == 'discount10%') {
        totalAfterDiscount = total! - (total! * 0.10);
      }
      if (promoController.text == 'discount15%') {
        totalAfterDiscount = total! - (total! * 0.15);
      }
      if (promoController.text == 'discount20%') {
        totalAfterDiscount = total! - (total! * 0.20);
      }
    }
  }

  SnackBar checkOutSnackBar = const SnackBar(
    content: Text('sorry no items in your cart to check out'),
    backgroundColor: errorColor,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

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
      getTotalAfterDiscount();
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

  void clearCart() {
    for (var product in cartList) {
      removeProduct(product.id!);
    }
    for (var product in cartList) {
      productsRef.doc(product.id).update({
        'storage': (product.storage! - (product.totalPrice! / product.price!))
      });
    }
  }
}

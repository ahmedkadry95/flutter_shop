import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/utils/colors.dart';

class CartController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
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
  }

  updateProductStorage() async {
    for (var product in cartList) {
      print('product.count!');
      print(product.count!);
      print(product.count!.runtimeType);
      print('==============================');
      print('product.storage!');
      print(product.storage!);
      print(product.storage!.runtimeType);
      print('==============================');

      print((product.storage! - product.count!).toInt());
      await productsRef.doc(product.id).update({
        'storage': (product.storage! - product.count!).toInt(),
      });
    }
  }

  updateProductSoldTimes() async {
    for (var product in cartList) {
      await productsRef.doc(product.id).update({
        'sold_times': (product.soldTimes! + product.count!).toInt(),
      });
    }
  }

  List addToOrders() {
    var list = [];
    for (var i in cartList) {
      var map = {};
      map['title'] = i.title;
      map['count'] = i.count;
      list.add(map);
    }
    print(list);
    return list;
  }

  placeOrder(context) async {
    List<OrderProducts> orderProducts = [];
    for (var i in cartList) {
      OrderProducts orderProduct = OrderProducts(
        count: i.count,
        title: i.title,
      );
      orderProducts.add(orderProduct);
    }
    UserOrders userOrders =
        UserOrders(userId: currentUser!.uid, products: orderProducts);

    try {
      await ordersRef.add(userOrders.toJson());
      await updateProductStorage();
      await updateProductSoldTimes();
      clearCart();
      navigation.navigateToAndClearStack(RouteName.successOrder);
    } catch (e) {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.SCALE,
              title: 'Error',
              desc: 'sorry your order does\'t complete',
              btnCancelOnPress: () {})
          .show();
    }
  }

  showIndicatorDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        });
  }
}

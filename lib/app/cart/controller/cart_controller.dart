import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';

class CartController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference cartRef = FirebaseFirestore.instance.collection('users');
  List<ProductModel> cartList = [];
  double total = 0.0;

  getCart() async {
    var response = await cartRef.doc(currentUser?.uid).collection('cart').get();
    var data = response.docs;
    for (var item in data) {
      cartList.add(ProductModel.fromJason(item.data()));
    }
    setState(ViewState.idel);
  }

  removeProduct(String productId) {
    cartRef
        .doc(currentUser?.uid)
        .collection('cart')
        .doc(productId)
        .delete()
        .then((value) {
      print('product removed ');
      setState(ViewState.idel);
      cartList.removeWhere((element) => element.id == productId);
    });
  }

  void updateState() {
    setState(ViewState.idel);
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var i in cartList) {
      print(i.title);
      print(i.price);
      total = total + i.totalPrice!;
    }
    setState(ViewState.idel);

    return total;
  }
}

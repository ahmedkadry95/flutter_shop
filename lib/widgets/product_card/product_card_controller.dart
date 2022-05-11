import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';

class ProductCardController extends BaseController {
  bool isPressed = false;

  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference cartRef = FirebaseFirestore.instance.collection('users');
  String? userId;

  getUserId() {
    userId = currentUser?.uid;
  }

  addProductToCart(ProductModel model) async {
    cartRef
        .doc(currentUser?.uid)
        .collection('cart')
        .doc(model.id)
        .set(
      ProductModel.productToJson(
            id: model.id,
            title: model.title!,
            description: model.description!,
            image: model.image!,
            category: model.category!,
            measurementUnit: model.measurementUnit!,
            price: model.price!,
            quantity: model.quantity!,
            storage: model.storage!,
            count: model.count!,
            soldTimes: model.soldTimes!,
          ),
        )
        .then((value) {
      print('product add to cart ');
    });
  }

  isPressedSwitch() {
    isPressed = true;
    setState(ViewState.idel);
  }
}

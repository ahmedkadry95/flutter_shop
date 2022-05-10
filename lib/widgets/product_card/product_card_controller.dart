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

  addProductToCart(ProductModel _model) async {
    cartRef
        .doc(currentUser?.uid)
        .collection('cart')
        .doc(_model.id)
        .set(
      ProductModel.productToJson(
            id: _model.id,
            title: _model.title!,
            description: _model.description!,
            image: _model.image!,
            category: _model.category!,
            measurementUnit: _model.measurementUnit!,
            price: _model.price!,
            quantity: _model.quantity!,
            storage: _model.storage!,
            count: _model.count!,
            soldTimes: _model.soldTimes!,
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

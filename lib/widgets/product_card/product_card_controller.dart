import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';

class ProductCardController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference cartRef =
      FirebaseFirestore.instance.collection('user_cart');
  String? userId;
  ProductModel productModel = ProductModel();

  getUserId() {
    userId = currentUser?.uid;
  }

  addProductToCart(ProductModel _model) async {
    await getUserId();
    await cartRef
        .doc(userId)
        .collection(_model.id!)
        .doc(_model.id)
        .set(productModel.productToJson(
          id: _model.id,
          title: _model.title!,
          description: _model.description!,
          image: _model.image!,
          category: _model.category!,
          measurementUnit: _model.measurementUnit!,
          price: _model.price!,
          quantity: _model.quantity!,
          storage: _model.storage!,
        ));
  }
}
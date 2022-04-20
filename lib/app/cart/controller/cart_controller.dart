import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';

class CartController extends BaseController {
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference cartRef =
      FirebaseFirestore.instance.collection('user_cart');
  List<ProductModel> cartList = [];
  String? userId = '';

  getUserId() async {
    userId = await currentUser?.uid;
  }

  getUserCart() async {
    await getUserId();
    DocumentSnapshot documentSnapshot = await cartRef.doc(userId).get();
    var data = documentSnapshot.data();
  }
}

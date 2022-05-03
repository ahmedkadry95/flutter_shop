import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/explore/view/category_view.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class ExploreController extends BaseController {
  var navigation = locator<NavigationService>();
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> categoryList = [];
  String category = '';

  getCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: category)
        .get();

    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    print(data.length);
    for (var element in data) {
      print(element.data());
      categoryList.add(ProductModel.fromJason(element.data()));
    }
    setState(ViewState.idel);
  }

  categoryNavigator(context, category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryView(category),
      ),
    );
  }
}

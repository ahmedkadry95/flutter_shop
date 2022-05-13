
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/shop/widgets/search_item.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';

class Search extends SearchDelegate {
  ProductSearch productSearch = ProductSearch();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  buildSuggestions(BuildContext context) {
    productSearch.getSearchList();
    List<ProductModel> filter = productSearch.searchList
        .where((element) => element.title!.startsWith(query))
        .toList();

    return query == ''
        ? Container()
        : SingleChildScrollView(
      child: Column(
        children: <Widget>[...filter.map((e) => SearchItem(e)).toList()],
      ),
    );
  }
}

class ProductSearch extends BaseController {
  bool isPressed = false;

  final List<ProductModel> searchList = [];

  getSearchList() async {
    if (searchList.isEmpty) {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
      List<QueryDocumentSnapshot> data = querySnapshot.docs;
      for (var element in data) {
        searchList.add(ProductModel.fromJason(element.data()));
      }
      setState(ViewState.idel);
    }
  }

  isPressedSwitch() {
    isPressed = true;
    setState(ViewState.idel);
  }
}


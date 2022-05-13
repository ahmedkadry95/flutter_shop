import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/shop/widgets/search_item.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';



Container serchField() {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
        color: const Color(0xffF2F3F2),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        widthSpace(10),
        const Icon(
          Icons.search,
          color: Color(0xff7C7C7C),
        ),
        widthSpace(10),
        const Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xff7C7C7C),
          ),
        )
      ],
    ),
  );
}
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
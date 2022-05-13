import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/app/shop/controller/shop_controller.dart';
import 'package:flutter_shop/app/shop/widgets/banner_item.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/logo.dart';
import 'package:flutter_shop/widgets/product_card/product_card.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopController>(
      onModelReady: (controller) async {
        await controller.getLocation();
        await controller.getBanner();
        await controller.getAllProduct();
        await controller.getBestSelling();
      },
      builder: (context, controller, child) {
        if (controller.bestSellingList.isEmpty) {
          return const CircularProgressIndicator(
            color: mainColor,
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              heightSpace(20),
              centerLogo(),
              heightSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.black,
                    size: 22,
                  ),
                  AutoSizeText(
                    controller.street,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    minFontSize: 12,
                    maxFontSize: 16,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              heightSpace(20),
              SearchTextField(
                TextInputType.text,
              ),
              Icon(Icons.search).onTap(() {
                showSearch(context: context, delegate: Search());
              }),
              heightSpace(20),
              CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 3.0,
                    enlargeCenterPage: true,
                  ),
                  items: <Widget>[
                    ...controller.bannerList.map((item) {
                      return bannerItem(item);
                    }).toList(),
                  ]),
              heightSpace(30),
              Align(
                alignment: Alignment.centerLeft,
                child: blackTitle3('Exclusive Offer'),
              ),
              heightSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...controller.exclusiveOfferList.map(
                      (item) {
                        return ProductCard(item);
                      },
                    )
                  ],
                ),
              ),
              heightSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: blackTitle3('Best Selling'),
              ),
              heightSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...controller.bestSellingList.map(
                      (item) {
                        return ProductCard(item);
                      },
                    )
                  ],
                ),
              ),
              heightSpace(20),
            ],
          ),
        );
      },
    );
  }
}

class Search extends SearchDelegate {
  ProductSearch productSearch = ProductSearch._();

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
        .where((element) => element.title!.contains(query))
        .toList();

    return ListView.builder(
        itemCount:
            query == '' ? productSearch.searchList.length : filter.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: query == ''
                ? Text(
                    '${productSearch.searchList[index].title}',
                  )
                : Text(
                    '${filter[index].title}',
                  ),
          );
        });
  }
}

class ProductSearch extends BaseController {
  ProductSearch._();

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
}

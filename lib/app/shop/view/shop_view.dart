import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/controller/shop_controller.dart';
import 'package:flutter_shop/app/shop/widgets/product_card.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/app_indicator.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopController>(
      onModelReady: (controller) async {
        await controller.getLocation();
        await controller.getBanner();
        await controller.getExclusiveOffer();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                heightSpace(20),
                Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                ),
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
                      '${controller.city} ${controller.street} ',
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
                heightSpace(20),
                controller.bannerList.isEmpty
                    ? appIndicator()
                    : CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 3.0,
                          enlargeCenterPage: true,
                        ),
                        items: <Widget>[
                            ...controller.bannerList.map((item) {
                              return Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 120,
                                child: Image.network(
                                  item,
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              );
                            }).toList(),
                          ]),
                heightSpace(30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: blackTitle3('Exclusive Offer'),
                ),
                heightSpace(10),
                controller.exclusiveOfferList.isEmpty
                    ? appIndicator()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...controller.exclusiveOfferList.map((e) {
                              return ProductCard(
                                productName: e['title'],
                                productImage: e['image'],
                                productPrice:
                                    double.parse(e['price'].toString()),
                                productQuantity:
                                    double.parse(e['quantity'].toString()),
                                measurementUnit: e['measurement_unit'],
                              );
                            })
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
                      Container(
                        height: 120,
                        width: 80,
                        color: Colors.yellow,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        height: 120,
                        width: 80,
                        color: Colors.blue,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        height: 120,
                        width: 80,
                        color: Colors.blueGrey,
                        margin: const EdgeInsets.all(10),
                      ),
                      Container(
                        height: 120,
                        width: 80,
                        color: Colors.deepOrange,
                        margin: const EdgeInsets.all(10),
                      ),
                    ],
                  ),
                ),
                heightSpace(20),
              ],
            ),
          ),
        );
      },
    );
  }
}

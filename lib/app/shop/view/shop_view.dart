import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/controller/shop_controller.dart';
import 'package:flutter_shop/app/shop/view/track_order.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/logo.dart';
import 'package:flutter_shop/widgets/product_card/product_card.dart';

import '../widgets/banner_item.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopController>(
      onModelReady: (controller) async {
        await controller.currentSessionService.getLocationDetails();
        await controller.getBanner();
        await controller.getAllProduct();
        await controller.getBestSelling();
        await controller.getOrderIdFromPref();
      },
      builder: (context, controller, child) {
        if (controller.bestSellingList.isEmpty) {
          return const CircularProgressIndicator(
            color: mainColor,
          );
        }
        return Container(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  heightSpace(20),
                  centerLogo(),
                  heightSpace(20),
                  controller.currentSessionService.locationData == null
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              // color: warningColor,
                              borderRadius: BorderRadius.circular(4)),
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/warning.png',
                                height: 25,
                                width: 25,
                              ),
                              widthSpace(10),
                              blackDescriptionTextSmall(
                                  'Please active location services '),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 22,
                            ),
                            AutoSizeText(
                              controller.currentSessionService.area,
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
                  serchField().onTap(() {
                    showSearch(context: context, delegate: Search());
                  }),
                  heightSpace(20),
                  trackOrder(),
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
            ),
          ),
        );
      },
    );
  }
}

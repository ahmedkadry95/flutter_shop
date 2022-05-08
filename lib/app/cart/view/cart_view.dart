import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/view/cart_item.dart';
import 'package:flutter_shop/app/cart/widgets/delivery_item.dart';
import 'package:flutter_shop/app/cart/widgets/payment_item.dart';
import 'package:flutter_shop/app/cart/widgets/promo_code.dart';
import 'package:flutter_shop/app/cart/widgets/total_cost.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

import '../../../widgets/main_button.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartController>(
      onModelReady: (controller) async {
        await controller.getCart();
        await controller.getUserData();
        controller.getTotalPrice();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heightSpace(20),
              blackTitle2('My Cart'),
              heightSpace(10),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ...controller.cartList.map((e) {
                      return CartItem(e, () async {
                        print('remove');
                        controller.removeProduct(e.id!);
                      });
                    }).toList()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: MainButton(
                  text: 'Go to checkout',
                ).onTap(() {
                  if (controller.cartList.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(controller.checkOutSnackBar);
                  } else {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return ListView(
                            children: [
                              heightSpace(45),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Row(
                                  children: [
                                    blackTitle3('Check Out'),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.navigation.goBack();
                                      },
                                      icon: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                              ),
                              heightSpace(20),
                              deliveryItem(controller),
                              paymentItem(),
                              heightSpace(10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    blackTitle4('Promo Code'),
                                    heightSpace(10),
                                    promoCode(controller, context),
                                    heightSpace(25),
                                    blackTitle4('Total cost'),
                                    heightSpace(10),
                                    totalCost(controller),
                                    heightSpace(30),
                                    MainButton(text: 'Place order').onTap(() {
                                      controller.showIndicatorDialog(context);
                                      controller.placeOrder(context);
                                    })
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                  }
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

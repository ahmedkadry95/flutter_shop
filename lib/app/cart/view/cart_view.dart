import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/view/cart_item.dart';
import 'package:flutter_shop/app/cart/widgets/delivery_item.dart';
import 'package:flutter_shop/app/cart/widgets/payment_item.dart';
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
                                  blackTitle3('Check out'),
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
                                    controller.clearCart();
                                  })
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                }),
              )
            ],
          ),
        );
      },
    );
  }

  Column totalCost(CartController controller) {
    return Column(
      children: [
        ...controller.cartList.map(
          (e) => Row(
            children: [
              billText(
                '${e.title}  *  ${(e.totalPrice != 1 ? (e.totalPrice! / e.price!).toInt() : 1)}',
              ),
              const Spacer(),
              billText(
                '${(e.totalPrice != 1 ? e.totalPrice : e.price!)} ',
              ),
            ],
          ),
        ),
        const Divider(
          color: dividerColor,
        ),
        heightSpace(10),
        Row(
          children: [
            billText(
              'Total',
            ),
            const Spacer(),
            billText(
              '${controller.getTotalPrice()}',
            ),
          ],
        ),
        controller.isValid
            ? Row(
                children: [
                  billText(
                    'Total after discount',
                  ),
                  const Spacer(),
                  billText(
                    '${controller.totalAfterDiscount}',
                  ),
                ],
              )
            : Container(),
        heightSpace(10),
      ],
    );
  }

  Row promoCode(CartController controller, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 55,
            child: TextFormField(
              textAlign: TextAlign.justify,
              cursorColor: blackColor,
              controller: controller.promoController,
              decoration: InputDecoration(
                // isDense: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD5D7E0),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD5D7E0),
                  ),
                ),
                suffix: controller.isValid == true
                    ? const Icon(
                        Icons.check_circle,
                        color: mainColor,
                      )
                    : const Text(''),
              ),
            ),
          ),
        ),
        widthSpace(10),
        blackTitle5('Submit').onTap(() {
          controller.checkPromoCode(context);
        })
      ],
    );
  }
}

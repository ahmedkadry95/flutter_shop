import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/view/cart_item.dart';
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
                  controller.checkOut(context);
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

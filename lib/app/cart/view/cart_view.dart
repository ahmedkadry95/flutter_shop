import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/widgets/cart_button.dart';
import 'package:flutter_shop/app/cart/widgets/cart_item.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartController>(
      onModelReady: (controller) async {
        await controller.getCart();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heightSpace(25),
              blackTitle2('My Cart'),
              heightSpace(25),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ...controller.cartList.map((e) {
                      return CartItem(e);
                    }).toList()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: CartButton(
                  totlatPrice: 19.6,
                ).onTap(() {
                  // NavigationServices.goTo(
                  //     context: context, routeName: RouteName.CHECK_OUT_SCREEN);
                }),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/widgets/cart_button.dart';
import 'package:flutter_shop/app/cart/widgets/cart_item.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseView<HomeController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My Cart'),
              Expanded(
                child: ListView(
                  children: [
                    const Divider(
                      color: dividerColor,
                    ),
                    cartItem(
                      productPriceForQuantity: '1kg/price',
                      productPrice: '\$1.95',
                      productName: 'Red Pepper',
                      productImage: 'assets/images/prudct_test.png',
                    ),
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

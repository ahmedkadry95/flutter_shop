import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/widgets/cart_button.dart';
import 'package:flutter_shop/app/cart/widgets/custom_stepper.dart';
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
              heightSpace(20),
              blackTitle2('My Cart'),
              heightSpace(10),
              const Divider(
                color: dividerColor,
                thickness: 1.5,
              ),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: controller.cartList.length,
              //       itemBuilder: (context, index) {
              //         return CartItem(controller.cartList[index]);
              //       }),
              // ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ...controller.cartList.map((e) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: dividerColor),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              e.image!,
                              height: 90,
                              width: 70,
                            ),
                            widthSpace(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title!),
                                heightSpace(4),
                                Text(e.quantity!.toString()),
                                heightSpace(15),
                                CustomStepper()
                              ],
                            ),
                            const Spacer(),
                            widthSpace(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.clear,
                                  color: grey,
                                  size: 20,
                                ).onTap(() async {
                                  await controller.removeProduct(e.id!);
                                  controller.updateState();
                                }),
                                heightSpace(40),
                                Text(e.price!.toString()),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList()
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: CartButton(
                  totlatPrice: 19.6,
                ).onTap(() {}),
              )
            ],
          ),
        );
      },
    );
  }
}

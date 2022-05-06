import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

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

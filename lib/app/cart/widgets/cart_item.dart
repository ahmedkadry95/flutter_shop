import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/widgets/custom_stepper.dart';
import 'package:flutter_shop/utils/spaces.dart';

import '../../../utils/colors.dart';

Widget cartItem({
  required String productName,
  required String productImage,
  required String productPriceForQuantity,
  required String productPrice,
}) {
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
        Image.asset(productImage),
        widthSpace(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName),
            heightSpace(4),
            Text(productPriceForQuantity),
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
            ),
            heightSpace(40),
            Text(productPrice),
          ],
        ),
      ],
    ),
  );
}

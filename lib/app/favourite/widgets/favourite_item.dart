import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

Widget favItem({
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
        bottom: BorderSide(color:dividerColor),
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
          ],
        ),
        const Spacer(),
        Text(productPrice),
        widthSpace(10),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ],
    ),
  );
}

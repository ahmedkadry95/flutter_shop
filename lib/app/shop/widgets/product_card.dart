import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class ProductCard extends StatelessWidget {
  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  String? productName, productImage, measurementUnit;
  double? productPrice, productQuantity;

  ProductCard({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.measurementUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffE2E2E2),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              productImage!,
              height: 90,
              width: 90,
              fit: BoxFit.fill,
            ),
          ),
          heightSpace(10),
          blackTitle4(
            capitalize(productName!),
          ),
          smallGreyHint2('$productQuantity $measurementUnit price'),
          heightSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              blackTitle4(
                capitalize('$productPrice \$'),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: mainColor,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

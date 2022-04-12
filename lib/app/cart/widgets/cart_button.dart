import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

class CartButton extends StatelessWidget {
  double totlatPrice;

  CartButton({
    required this.totlatPrice,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: size.width,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text('Go to Checkout'),
          Positioned(
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
              child: Text(
                '\$ $totlatPrice',
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

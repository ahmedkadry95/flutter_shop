import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

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

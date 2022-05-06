import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/utils/spaces.dart';

import '../../../utils/colors.dart';
import '../../../utils/texts.dart';

Container deliveryItem(CartController controller) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffD5D7E0)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ExpansionTile(
        collapsedTextColor: Colors.black87,
        collapsedIconColor: Colors.black87,
        textColor: Colors.black87,
        iconColor: Colors.black87,
        backgroundColor: whiteColor,
        collapsedBackgroundColor: const Color(0xffF1F3FA),
        title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Row(
            children: [
              blackTitle4('Delivery address'),
              widthSpace(10),
            ],
          ),
        ),
        children: [
          Row(
            children: [
              widthSpace(20),
              blackDescriptionTextSmall(
                  'Building number  :  ${controller.address['building_number']}'),
            ],
          ),
          heightSpace(5),
          Row(
            children: [
              widthSpace(20),
              blackDescriptionTextSmall(
                  'Street  :  ${controller.address['street']}'),
            ],
          ),
          heightSpace(5),
          Row(
            children: [
              widthSpace(20),
              blackDescriptionTextSmall(
                  'City  :  ${controller.address['city']}'),
            ],
          ),
          heightSpace(10),
        ],
      ),
    ),
  );
}

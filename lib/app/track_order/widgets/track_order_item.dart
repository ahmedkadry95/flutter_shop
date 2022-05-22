import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

Widget preparationItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'preparation' ||
      currentOrder?.orderState == 'delivery' ||
      currentOrder?.orderState == 'complete') {
    return BaseItem(
        text: 'We are preparing your order',
        icon: Icons.timer,
        color: mainColor);
  }
  return BaseItem(
      text: 'We are preparing your order',
      icon: Icons.timer,
      color: blackColor);
}

Widget deliveryItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'delivery' ||
      currentOrder?.orderState == 'complete') {
    return BaseItem(
        text: 'On the way',
        icon: Icons.delivery_dining_rounded,
        color: mainColor);
  }
  return BaseItem(
      text: 'On the way',
      icon: Icons.delivery_dining_rounded,
      color: blackColor);
  ;
}

Widget completeItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'Please receive your order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainColor,
          ),
        )
      ],
    );
  }
  return Row(
    children: [
      Icon(
        Icons.location_on,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'Please receive your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

Widget BaseItem(
    {required String text, required IconData icon, required Color color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          widthSpace(20),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Container(
          width: 3,
          height: 40,
          color: color,
        ),
      )
    ],
  );
}

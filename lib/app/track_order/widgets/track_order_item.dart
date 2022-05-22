


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
    return Row(
      children: [
        Icon(
          Icons.access_time_filled_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'We received your order',
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
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

Widget deliveryItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'delivery' ||
      currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.delivery_dining_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'your ',
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
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

Widget completeItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'We received your order',
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
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}
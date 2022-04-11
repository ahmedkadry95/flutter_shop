import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

Widget blackTitle1(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
  );
}

Widget smallGreyHint(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: grey,
    ),
  );
}

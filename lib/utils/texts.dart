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

Widget blackTitle2(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
  );
}

Widget blackTitle3(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: blackColor,
    ),
  );
}

Widget blackTitle4(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: blackColor,
    ),
  );
}

Widget blackDescriptionTextSmall(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: blackColor,
    ),
  );
}

Widget smallGreyHint1(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 14,
      color: grey,
    ),
  );
}

Widget smallGreyHint2(String text) {
  return Text(
    text,
    style:
        const TextStyle(fontSize: 12, color: grey, fontWeight: FontWeight.w700),
  );
}

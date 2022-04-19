import 'package:auto_size_text/auto_size_text.dart';
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
  return AutoSizeText(
    text,
    maxLines: 1,
    maxFontSize: 18,
    minFontSize: 16,
    overflow: TextOverflow.fade,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget blackTitle5(String text) {
  return AutoSizeText(
    text,
    maxLines: 1,
    maxFontSize: 16,
    minFontSize: 14,
    overflow: TextOverflow.fade,
    style: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
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
        const TextStyle(fontSize: 12, color: grey, fontWeight: FontWeight.w400),
  );
}

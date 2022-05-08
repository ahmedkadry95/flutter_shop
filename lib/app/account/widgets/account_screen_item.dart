import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

Widget userScreenItem({
  required IconData icon,
  required String text,
}) {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: dividerColor),
      ),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    child: Row(
      children: [
        Icon(
          icon,
          color: blackColor,
        ),
        widthSpace(8),
        blackDescriptionTextSmall(text),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        )
      ],
    ),
  );
}

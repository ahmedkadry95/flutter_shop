
import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

Widget userScreenItem({
  required String image,
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
        Image.asset(
          image,
          height: 20,
          width: 20,
        ),
        widthSpace(8),
        Text(text),
        const Spacer(),
        const Icon(Icons.arrow_forward_ios,size: 18,)
      ],
    ),
  );
}

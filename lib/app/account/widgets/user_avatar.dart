import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

Widget userAvatar(
    {required String image, required String email, required String userName}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        widthSpace(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userName),
                widthSpace(4),
                const Icon(
                  Icons.edit,
                  size: 14,
                  color: mainColor,
                )
              ],
            ),
            heightSpace(4),
            Text(email),
          ],
        ),
      ],
    ),
  );
}

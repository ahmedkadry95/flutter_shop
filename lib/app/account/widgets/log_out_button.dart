

import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

Widget logOutButton() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    width: double.infinity,
    height: 65,
    decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.circular(15)),
    child: Stack(
      alignment: Alignment.center,
      children: const [
        Positioned(
          left: 20,
          child: Icon(
            Icons.logout,
            color: mainColor,
          ),
        ),
        Text(
          'Log Out',
          style: TextStyle(
            color: mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        //Image.asset('assets/icons/log_out.png')
      ],
    ),
  );
}

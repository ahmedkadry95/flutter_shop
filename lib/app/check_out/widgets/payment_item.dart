import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

Widget paymentItem() {
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
              blackTitle4('Payment method'),
              widthSpace(10),
            ],
          ),
        ),
        children: [
          RadioListTile(
            value: 0,
            groupValue: 0,
            onChanged: (val) {},
            activeColor: mainColor,
            title: blackDescriptionTextSmall('Cash'),
          ),
          RadioListTile(
            value: 1,
            groupValue: 0,
            onChanged: (val) {},
            activeColor: mainColor,
            title: const Text(
              'Online payment will be available soon',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: grey,
              ),
            ),
          ),
          heightSpace(10),
        ],
      ),
    ),
  );
}

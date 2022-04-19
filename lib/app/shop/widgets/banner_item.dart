import 'package:flutter/material.dart';

Container bannerItem(String item) {
  return Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    height: 120,
    child: Image.network(
      item,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
  );
}

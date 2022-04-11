import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

class MainButton extends StatelessWidget {
  String text;

  MainButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

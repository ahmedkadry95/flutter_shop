import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';

class LabelTerms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "By continuing you agree to our ",
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 1.6),
          children: [
            TextSpan(
              text: "Terms of Service",
              style: TextStyle(color: mainColor),
            ),
            TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy.",
              style: TextStyle(color: mainColor),
            ),
          ]),
    );
  }
}

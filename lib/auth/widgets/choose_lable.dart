import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

class ChooseLabel extends StatelessWidget {
  String black;
  String green;

  ChooseLabel({
    required this.black,
    required this.green,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            black,
            style: TextStyle(
              color: mainColor,
            ),
          ),
          widthSpace(4),
          Text(
            green,
            style: TextStyle(
              color: mainColor,
            ),
          )
        ],
      ),
    );
  }
}

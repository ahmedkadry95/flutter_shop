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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            black,
            style: const TextStyle(
              color: grey,
            ),
          ),
          widthSpace(4),
          Text(
            green,
            style: const TextStyle(
              color: mainColor,
            ),
          )
        ],
      ),
    );
  }
}

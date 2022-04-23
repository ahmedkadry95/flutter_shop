import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/extensions.dart';

import '../../../utils/colors.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({Key? key}) : super(key: key);
  int value = 0;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        calcButton(icon: Icons.remove, color: grey).onTap(() {
          setState(() {
            if (widget.value > 0) {
              widget.value--;
            }
          });
        }),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '${widget.value}',
          ),
        ),
        calcButton(
          icon: Icons.add,
          color: mainColor,
        ).onTap(() {
          setState(() {
            widget.value++;
          });
        }),
      ],
    );
  }
}

Widget calcButton({required IconData icon, required Color color}) {
  return Container(
    padding: const EdgeInsets.all(6),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      border: Border.all(color: dividerColor),
    ),
    child: Icon(
      icon,
      color: color,
      size: 20,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/app/placed_orders/controller/placed_order_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PlacedOrders>(
      onModelReady: (controller) {
        controller.navigationToHome();
      },
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('assets/images/background_mask.png'),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: mainColor,
                    size: 140,
                  ),
                  heightSpace(40),
                  const Text(
                    'Be ready to receive your order during 45 min',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

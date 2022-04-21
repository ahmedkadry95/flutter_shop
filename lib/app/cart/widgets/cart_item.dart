import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/cart/widgets/custom_stepper.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';

import '../../../utils/colors.dart';

class CartItem extends StatelessWidget {
  ProductModel _model;

  CartItem(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: dividerColor),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                _model.image!,
                height: 90,
                width: 70,
              ),
              widthSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_model.title!),
                  heightSpace(4),
                  Text(_model.quantity!.toString()),
                  heightSpace(15),
                  CustomStepper()
                ],
              ),
              const Spacer(),
              widthSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.clear,
                    color: grey,
                    size: 20,
                  ).onTap(() async {
                    await controller.removeProduct(_model.id!);
                    controller.updateState();
                  }),
                  heightSpace(40),
                  Text(_model.price!.toString()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

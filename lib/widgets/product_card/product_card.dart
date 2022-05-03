import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/product_card/product_card_controller.dart';

String capitalize(String string) {
  if (string.isEmpty) {
    return string;
  }

  return string[0].toUpperCase() + string.substring(1);
}

class ProductCard extends StatelessWidget {
  ProductModel _model;

  ProductCard(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductCardController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          width: 170,
          height: 240,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xffE2E2E2),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  _model.image!,
                  height: 110,
                  width: 110,
                  fit: BoxFit.contain,
                ),
              ),
              heightSpace(10),
              blackTitle4(
                capitalize(_model.title!),
              ),
              smallGreyHint2(
                  '${_model.quantity} ${_model.measurementUnit} price'),
              heightSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  blackTitle4(
                    capitalize('${_model.price} \$'),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isPressed == false ? mainColor : grey,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ).onTap(() async {
                    await controller.addProductToCart(_model);
                    controller.isPressedSwitch();
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

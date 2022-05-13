import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/product_card/product_card_controller.dart';

import '../../../utils/colors.dart';

class SearchItem extends StatelessWidget {
  ProductModel _model;

  SearchItem(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductCardController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
            border:  Border(
              bottom: BorderSide(
                color: dividerColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  blackTitle4(
                    '${_model.title}',
                  ),
                  heightSpace(5),
                  smallGreyHint1(
                    '${_model.price}',
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
        );
      },
    );
  }
}

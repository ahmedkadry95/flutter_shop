import 'package:flutter/material.dart';
import 'package:flutter_shop/app/cart/controller/cart_controller.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class CartItem extends StatelessWidget {
  ProductModel _model;
  int count = 1;

  final Function remove;

  CartItem(this._model, this.remove);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20),
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
                  blackTitle4(_model.title!),
                  heightSpace(4),
                  smallGreyHint2(
                      '${_model.quantity} ${_model.measurementUnit} price'),
                  heightSpace(15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      calcButton(icon: Icons.remove, color: grey).onTap(() {
                        if (count > 1) {
                          count--;
                          _model.totalPrice = (count * _model.price!);

                          controller.setState(ViewState.idel);
                        }
                      }),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: blackTitle4('$count'),
                      ),
                      calcButton(
                        icon: Icons.add,
                        color: mainColor,
                      ).onTap(() {
                        if (count < _model.storage!) {
                          count++;
                          _model.totalPrice = (count * _model.price!);
                          controller.setState(ViewState.idel);
                        }
                      }),
                    ],
                  )
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
                  ).onTap(() {
                    remove();
                  }),
                  heightSpace(40),
                  Text(
                      '${_model.totalPrice == 1 ? _model.price : _model.totalPrice}'),
                ],
              ),
            ],
          ),
        );
      },
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

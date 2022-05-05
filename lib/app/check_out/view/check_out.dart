import 'package:flutter/material.dart';
import 'package:flutter_shop/app/check_out/controller/check_out_controller.dart';
import 'package:flutter_shop/app/check_out/widgets/delivery_item.dart';
import 'package:flutter_shop/app/check_out/widgets/payment_item.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

import '../../../widgets/main_button.dart';

class CheckOutView extends StatelessWidget {
  double orderPrice;

  CheckOutView(this.orderPrice, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CheckOutController>(
      onModelReady: (controller) {
        controller.getUserData();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                centerTitle: true,
                title: blackTitle2('Check Out'),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.navigation.goBack();
                  },
                ),
              ),
              body: ListView(
                children: [
                  const Divider(
                    color: dividerColor,
                    thickness: 1.5,
                  ),
                  heightSpace(20),
                  deliveryItem(controller),
                  paymentItem(),
                  heightSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            blackTitle4('Promo code'),
                            const Spacer(),
                          ],
                        ),
                        heightSpace(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 55,
                                child: TextFormField(
                                  textAlign: TextAlign.justify,
                                  cursorColor: blackColor,
                                  controller: controller.promoController,
                                  decoration: InputDecoration(
                                    isDense: true,

                                    // contentPadding: const EdgeInsets.only(top: 20),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffD5D7E0),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffD5D7E0),
                                      ),
                                    ),
                                    suffix: controller.isValid == true
                                        ? const Icon(
                                            Icons.check_circle,
                                            color: mainColor,
                                          )
                                        : const Text(''),
                                  ),
                                ),
                              ),
                            ),
                            widthSpace(10),
                            blackTitle5('Submit').onTap(() {
                              controller.checkPromoCode(context);
                            })
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

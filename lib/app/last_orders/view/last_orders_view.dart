import 'package:flutter/material.dart';
import 'package:flutter_shop/app/last_orders/controller/last_orders_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class LastOrders extends StatelessWidget {
  const LastOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LastOrdersController>(
      onModelReady: (controller) async {
        controller.getLastOrders();
      },
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                leading: IconButton(
                  onPressed: () {
                    controller.navigation.goBack();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                title: blackTitle2('Your orders'),
              ),
              body: controller.lastOrdersList.isEmpty
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/orders.png'),
                        Row(),
                        heightSpace(30),
                        blackDescriptionTextSmall('no order\'s placed yet')
                      ],
                    )
                  : ListView.builder(
                      itemCount: controller.lastOrdersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            elevation: 6,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: Column(
                                children: <Widget>[
                                  ...controller.lastOrdersList[index].products!
                                      .map((e) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0),
                                      child: Row(
                                        children: [
                                          blackTitle4(e.title!),
                                          blackTitle4(' * '),
                                          blackTitle4(e.count!.toString()),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
        );
      },
    );
  }
}

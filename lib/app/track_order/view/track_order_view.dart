import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/app/track_order/widgets/track_order_item.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class TrackOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TrackOrderController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: backgroundColor,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: blackColor,
                  ),
                  onPressed: () {
                    controller.navigation
                        .navigateToAndClearStack(RouteName.home);
                  },
                ),
                title: blackTitle3('Track your order'),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream: controller.usersStream,
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    );
                  }
                  List data = snapshot.data!.docs;
                  UserOrders? currentOrder;
                  for (var i in data) {
                    Map data = i.data()! as Map;
                    if (data['order_id'] == controller.currentSessionService.currentOrderId) {
                      currentOrder = (UserOrders.fromJson(data));
                    }
                  }
                  if (currentOrder?.orderState == 'complete') {
                    controller.updateState();
                  }
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: mainColor,
                                ),
                                widthSpace(20),
                                Text(
                                  'Your order received',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4),
                              child: Container(
                                width: 3,
                                height: 40,
                                color: mainColor,
                              ),
                            )
                          ],
                        ),
                        preparationItem(currentOrder: currentOrder),
                        deliveryItem(currentOrder: currentOrder),
                        completeItem(currentOrder: currentOrder),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}


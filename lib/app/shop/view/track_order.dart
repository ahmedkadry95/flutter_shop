

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';

BaseView<TrackOrderController> trackOrder() {
  return BaseView<TrackOrderController>(
    onModelReady: (controller) async {},
    builder: (context, controller, child) {
      return StreamBuilder<QuerySnapshot>(
        stream: controller.usersStream,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
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
            if (data['order_id'] ==
                controller
                    .currentSessionService.currentOrderId) {
              currentOrder = (UserOrders.fromJson(data));
            }
          }
          if (currentOrder?.orderState == 'complete') {
            controller.updateState();
          }
          return controller
              .currentSessionService.currentOrderId ==
              ''
              ? Container()
              : Container(
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 120,
            padding: const EdgeInsets.symmetric(
                horizontal: 15),
            child: Center(
              child: Row(
                children: [
                  Text(
                    'Track your order',
                    style: TextStyle(
                        color: backgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: backgroundColor,
                  )
                ],
              ),
            ),
          ).onTap(() {
            controller.navigation
                .navigateTo(RouteName.trackOrder);
          });
        },
      );
    },
  );
}
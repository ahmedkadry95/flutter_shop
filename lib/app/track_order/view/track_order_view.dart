import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

CurrentSessionService currentSessionService = CurrentSessionService();

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('orders').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            if (data['order_id'] == currentSessionService.currentOrderId) {
              currentOrder = (UserOrders.fromJson(data));
            }
          }
          // access_time_filled_rounded
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: mainColor,
                    ),
                    widthSpace(20),
                    Text(
                      'We received your order',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: mainColor,
                      ),
                    )
                  ],
                ),
                heightSpace(30),
                preparationItem(currentOrder: currentOrder),
                heightSpace(30),
                deliveryItem(currentOrder: currentOrder),
                heightSpace(30),
                completeItem(currentOrder: currentOrder),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget preparationItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'preparation' ||
      currentOrder?.orderState == 'delivery' ||
      currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'We received your order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainColor,
          ),
        )
      ],
    );
  }
  return Row(
    children: [
      Icon(
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

Widget deliveryItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'delivery' ||
      currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.delivery_dining_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'your ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainColor,
          ),
        )
      ],
    );
  }
  return Row(
    children: [
      Icon(
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

Widget completeItem({
  UserOrders? currentOrder,
}) {
  if (currentOrder?.orderState == 'complete') {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled_rounded,
          color: mainColor,
        ),
        widthSpace(20),
        Text(
          'We received your order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainColor,
          ),
        )
      ],
    );
  }
  return Row(
    children: [
      Icon(
        Icons.access_time_filled_rounded,
        color: blackColor,
      ),
      widthSpace(20),
      Text(
        'We received your order',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: blackColor,
        ),
      )
    ],
  );
}

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
              body: Test(),
            ),
          ),
        );
      },
    );
  }
}

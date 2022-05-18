import 'package:flutter/material.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/base_view.dart';

class TrackOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TrackOrderController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container();
      },
    );
  }
}

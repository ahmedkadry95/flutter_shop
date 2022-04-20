import 'package:flutter/material.dart';
import 'package:flutter_shop/app/delivery_address/controller/delivery_address_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/logo.dart';

class DeliveryAddressView extends StatelessWidget {
  const DeliveryAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DeliveryAddressController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace(30),
                  centerLogo(),
                  heightSpace(40),
                  blackTitle3('data'),
                  blackDescriptionTextSmall('data'),
                  Text('data'),
                  ElevatedButton(
                    onPressed: () {
                      controller.navigation
                          .navigateTo(RouteName.addDeliveryAddress);
                    },
                    child: Text('add address'),
                  )
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}

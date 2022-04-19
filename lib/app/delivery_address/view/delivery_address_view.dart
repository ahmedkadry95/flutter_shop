import 'package:flutter/material.dart';
import 'package:flutter_shop/app/delivery_address/controller/delivery_address_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/spaces.dart';
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
              body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    heightSpace(20),
                    centerLogo(),
                    heightSpace(40),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          if (controller.formKey.currentState!.validate()) {
                            // Process data.
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

              // body: Form(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 15),
              //     child: ListView(
              //       children: [

              //
              //         heightSpace(20),
              //       ],
              //     ),
              //   ),
              // ),
              ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/app/add_delivery_address/controller/add_delivery_address_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/widgets/logo.dart';

class AddDeliveryAddressView extends StatelessWidget {
  const AddDeliveryAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddDeliveryAddressController>(
      onModelReady: (controller) {
        controller.updateAddress();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
              body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    heightSpace(20),
                    centerLogo(),
                    heightSpace(40),
                    accountTextFormField(
                      controller: controller.cityController,
                      label: 'city',
                    ),
                    heightSpace(10),
                    accountTextFormField(
                      controller: controller.streetController,
                      label: 'street',
                    ),
                    heightSpace(10),
                    accountTextFormField(
                      controller: controller.buildingController,
                      label: 'building number',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // if (controller.formKey.currentState!.validate()) {
                          //   // Process data.
                          // }
                          controller.updateAddress();
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }

  TextFormField accountTextFormField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 20),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: dividerColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: dividerColor, width: 1.0),
        ),
        border: InputBorder.none,
        // hintText: 'city',
        label: Text(
          label,
          style: TextStyle(color: mainColor, fontSize: 16),
        ),
      ),
    );
  }
}

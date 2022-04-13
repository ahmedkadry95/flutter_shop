import 'package:flutter/material.dart';
import 'package:flutter_shop/admin/controller/admin_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: errorColor,
          ),
        );
      },
    );
  }
}

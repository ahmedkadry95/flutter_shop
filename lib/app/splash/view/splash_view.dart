import 'package:flutter/material.dart';
import 'package:flutter_shop/app/splash/controller/splash_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashController>(
      onModelReady: (controller) async {
        controller.splashNavigation();
      },
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Center(
            child: Image.asset('assets/images/splash_logo.png'),
          ),
        );
      },
    );
  }
}

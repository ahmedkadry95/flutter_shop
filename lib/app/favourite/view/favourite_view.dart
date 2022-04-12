import 'package:flutter/material.dart';
import 'package:flutter_shop/app/favourite/widgets/favourite_item.dart';
import 'package:flutter_shop/app/favourite/widgets/main_button.dart';
import 'package:flutter_shop/app/splash/controller/splash_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashController>(
      onModelReady: (controller) async {
        // await controller.checkIsLogIn();
        // controller.splashNavigation();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Favorites'),
              Expanded(
                child: ListView(
                  children: [
                    const Divider(
                      color: dividerColor,
                    ),
                    favItem(
                      productPriceForQuantity: '1kg/price',
                      productPrice: '\$1.95',
                      productName: 'Red Pepper',
                      productImage: 'assets/images/prudct_test.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: MainButton(
                  text: "Add all to cart",
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

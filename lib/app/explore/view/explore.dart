import 'package:flutter/material.dart';
import 'package:flutter_shop/app/explore/controller/explore_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/extensions.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                title: blackTitle2('Find Products'),
                centerTitle: true,
                backgroundColor: backgroundColor,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 25,
                          crossAxisSpacing: 20,
                          childAspectRatio: .95,
                        ),
                        children: [
                          categoriesItem(
                            border: const Color(0xffF6A493),
                            image: 'assets/images/categories/meat.png',
                            background: const Color(0xffF8E4E0),
                            title: 'Meat & Fish',
                          ).onTap(() {
                            controller.categoryNavigator(context, 'meat');
                          }),
                          categoriesItem(
                            border: const Color(0xffB7DFF5),
                            image: 'assets/images/categories/drinks.png',
                            background: const Color(0xffECF7FE),
                            title: 'Beverages',
                          ).onTap(() {
                            controller.categoryNavigator(context, 'drinks');
                          }),
                          // categoriesItem(
                          //   border: const Color(0xffF9BE7C),
                          //   image: 'assets/images/categories/oil.png',
                          //   background: const Color(0xffFFF6ED),
                          //   title: 'Cooking Oil & Ghee',
                          // ),
                          categoriesItem(
                            background: const Color(0xffEFF6F2),
                            image: 'assets/images/categories/fruit.png',
                            border: const Color(0xff79B991),
                            title: 'Fresh Fruits & Vegetable',
                          ).onTap(() {
                            controller.categoryNavigator(context, 'fruit');
                          }),
                          categoriesItem(
                            background: const Color(0xffFFF9E5),
                            image: 'assets/images/categories/milk.png',
                            border: const Color(0xffFDE499),
                            title: 'Dairy & Eggs',
                          ).onTap(() {
                            controller.categoryNavigator(context, 'milk');
                          }),
                          categoriesItem(
                            background: const Color(0xffF4EBF7),
                            image: 'assets/images/categories/bakery.png',
                            border: const Color(0xffD9BCE5),
                            title: 'Bakery & Snacks',
                          ).onTap(() {
                            controller.categoryNavigator(context, 'bekary');
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container categoriesItem({
    required Color background,
    required Color border,
    required String image,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: border,
          width: 1.2,
        ),
        color: background,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 80,
              width: 100,
              fit: BoxFit.fill,
            ),
            heightSpace(12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

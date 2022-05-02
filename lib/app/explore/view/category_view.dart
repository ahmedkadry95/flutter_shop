import 'package:flutter/material.dart';
import 'package:flutter_shop/app/explore/controller/explore_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/product_card/product_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return Scaffold(
          body: ListView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              return ProductCard(controller.categoryList[index]);
            },
          ),
        );
      },
    );
  }
}

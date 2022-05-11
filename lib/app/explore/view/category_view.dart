import 'package:flutter/material.dart';
import 'package:flutter_shop/app/explore/controller/explore_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/texts.dart';
import 'package:flutter_shop/widgets/product_card/product_card.dart';

class CategoryView extends StatelessWidget {
  String category;

  CategoryView(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreController>(
      onModelReady: (controller) {
        controller.getCategory(category);
      },
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
                elevation: 0,
                backgroundColor: backgroundColor,
                leading: IconButton(
                  onPressed: () {
                    controller.navigation.goBack();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                title: blackTitle2(category),
              ),
              body: GridView.builder(
                itemCount: controller.categoryList.length,
                itemBuilder: (context, index) {
                  return ProductCard(controller.categoryList[index]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

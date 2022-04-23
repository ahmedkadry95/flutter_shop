import 'package:flutter/material.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
            child: Column(
              children: [
                blackTitle2('Find Products'),
                const SizedBox(
                  height: 15,
                ),
                SearchTextField(TextInputType.text),
                heightSpace(25),
                Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 20,
                    ),
                    children: [
                      categoriesItem(
                        background: const Color(0xffF6A493),
                        image: 'assets/images/categories/meat.png',
                        border: const Color(0xffF8E4E0),
                        title: '',
                      ),
                    ],
                  ),
                ),
              ],
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
          color: background,
          // color: const Color(0xffF6A493),
        ),
        color: border,
        // color: const Color(0xffF8E4E0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 110,
            width: 75,
            // fit: BoxFit.,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

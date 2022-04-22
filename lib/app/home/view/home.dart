import 'package:flutter/material.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: controller.pages[controller.currentIndex],
            ),
            bottomNavigationBar: Material(
              elevation: 60,
              clipBehavior: Clip.hardEdge,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.black,
                selectedItemColor: mainColor,
                showUnselectedLabels: false,
                currentIndex: controller.currentIndex,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                onTap: (index) {
                  controller.changeNavBarIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: 'Shop',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.manage_search_rounded),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Cart',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.favorite_border_outlined),
                  //   label: 'Favorite',
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: 'Account',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

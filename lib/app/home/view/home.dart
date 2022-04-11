import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/auth/log_in/controller/login_controller.dart';
import 'package:flutter_shop/app/splash/view/splash_view.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LogInController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('home'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`');
                    await FirebaseAuth.instance.signOut();
                    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`');

                    print('signOut sucess');

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SplashView(),
                      ),
                    );
                  },
                  child: Icon(Icons.logout),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

//
// class Home extends StatefulWidget {
//   Home({Key? key}) : super(key: key);
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List<Widget> pages =  [
//     Shop(),
//     Explore(),
//     Cart(),
//     Fav(),
//     Account(),
//   ];
//   int selectedPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: pages[selectedPage],
//       ),
//       bottomNavigationBar: Material(
//         elevation: 60,
//         clipBehavior: Clip.hardEdge,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//         child: BottomNavigationBar(
//           unselectedItemColor: Colors.black,
//           selectedItemColor: AppColors.color_main,
//           showUnselectedLabels: false,
//           currentIndex: selectedPage,
//           selectedLabelStyle:
//           const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//           onTap: (index) {
//             setState(() {
//               selectedPage = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_rounded),
//               label: 'Shop',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.manage_search_rounded),
//               label: 'Explore',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart_outlined),
//               label: 'Cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite_border_outlined),
//               label: 'Favorite',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person_outline),
//               label: 'Account',
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

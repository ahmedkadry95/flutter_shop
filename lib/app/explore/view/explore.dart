import 'package:flutter/material.dart';
import 'package:flutter_shop/app/home/controller/home_controller.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseView<HomeController>(
      onModelReady: (controller) {},
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Color(0xffFAFAFA),
            toolbarHeight: 100,
            centerTitle: true,
            title: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text('Find Products'),
                const SizedBox(
                  height: 15,
                ),
                SearchTextField(TextInputType.text),
              ],
            ),
          ),
          // body: Container(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          //   color: const Color(0xffFAFAFA),
          //   child: FutureBuilder(
          //     future: ProductsWebServise().productCategory(),
          //     builder: (context, snapshot) {
          //       return snapshot.hasData
          //           ? GridView.builder(
          //               gridDelegate:
          //                   const SliverGridDelegateWithFixedCrossAxisCount(
          //                 childAspectRatio: .9,
          //                 crossAxisCount: 2,
          //               ),
          //               itemCount: snapshot.data.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return InkWell(
          //                   onTap: () {
          //                     Util.go_screen(
          //                       context,
          //                       Proudcts(
          //                         snapshot.data[index]['id'],
          //                         '${snapshot.data[index]['name']}',
          //                       ),
          //                     );
          //                   },
          //                   child: Container(
          //                     margin: const EdgeInsets.all(10),
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 10),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         Image.network(
          //                           'http://localhost/shop/${snapshot.data[index]['img']}',
          //                           height: 90,
          //                         ),
          //                         const SizedBox(
          //                           height: 20,
          //                         ),
          //                         Text(
          //                           '${snapshot.data[index]['name']}',
          //                           textAlign: TextAlign.center,
          //                           style: TextStyle(
          //                               fontWeight: FontWeight.w600,
          //                               fontSize: 15),
          //                         ),
          //                       ],
          //                     ),
          //                     decoration: BoxDecoration(
          //                       border: Border.all(
          //                         color: HexColor(
          //                             snapshot.data[index]['border_color']),
          //                       ),
          //                       borderRadius: BorderRadius.circular(15),
          //                       color: HexColor(snapshot.data[index]['color']),
          //                     ),
          //                   ),
          //                 );
          //               },
          //             )
          //           : const Center(
          //               child: CircularProgressIndicator(
          //                 color: Constant.color_main,
          //               ),
          //             );
          //     },
          //   ),
          // ),
        );
      },
    );
  }
}

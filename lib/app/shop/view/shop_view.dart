import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/shop/controller/shop_controller.dart';
import 'package:flutter_shop/app/shop/widgets/search_textfield.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/spaces.dart';
import 'package:flutter_shop/utils/texts.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopController>(
      onModelReady: (controller) async {
        await controller.getBanner();
        controller.updateState();
      },
      builder: (context, controller, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace(20),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 35,
                  ),
                  heightSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      Text('datadatadata'),
                    ],
                  ),
                  heightSpace(20),
                  SearchTextField(
                    TextInputType.text,
                  ),

                  // heightSpace(15),
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //       autoPlay: true, enlargeCenterPage: true, aspectRatio: 2 / 1),
                  //   items: viewModel.bannarList,
                  // ),
                  heightSpace(20),

                  controller.bannerList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          items: <Widget>[
                              ...controller.bannerList.map((item) {
                                return Image.network(item);
                              }).toList(),
                            ]

                          // items: controller.bannerList!.isEmpty ? [] : for(var i in )
                          // [
                          //   Image.network(
                          //       'https://firebasestorage.googleapis.com/v0/b/flutter-shop95.appspot.com/o/banner%2Fimage_picker7218115680292270736.jpg?alt=media&token=e595d079-43de-42bd-8dd8-d2f6dfc2618e'),
                          //   Image.network(
                          //       'https://firebasestorage.googleapis.com/v0/b/flutter-shop95.appspot.com/o/banner%2Fimage_picker7218115680292270736.jpg?alt=media&token=e595d079-43de-42bd-8dd8-d2f6dfc2618e'),
                          // ]

                          // controller.bannerList?.map((e) {
                          //   return Image.network(e.toString());
                          // }).toList()

                          // const [
                          //   Icon(Icons.add),
                          //   Icon(Icons.remove),
                          //   Icon(Icons.email),
                          // //  Image.network(“URL")
                          // ],
                          ),
                  heightSpace(30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: blackTitle3('Exclusive Offer'),
                  ),
                  heightSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.yellow,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.blue,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.blueGrey,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.deepOrange,
                          margin: const EdgeInsets.all(10),
                        ),
                      ],
                    ),
                  ),
                  heightSpace(20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: blackTitle3('Best Selling'),
                  ),
                  heightSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.yellow,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.blue,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.blueGrey,
                          margin: const EdgeInsets.all(10),
                        ),
                        Container(
                          height: 120,
                          width: 80,
                          color: Colors.deepOrange,
                          margin: const EdgeInsets.all(10),
                        ),
                      ],
                    ),
                  ),
                  heightSpace(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

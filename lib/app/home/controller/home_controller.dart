import 'package:flutter/material.dart';
import 'package:flutter_shop/app/account/view/account_view.dart';
import 'package:flutter_shop/app/cart/view/cart_view.dart';
import 'package:flutter_shop/app/explore/view/explore.dart';
import 'package:flutter_shop/app/favourite/view/favourite_view.dart';
import 'package:flutter_shop/app/shop/view/shop_view.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';

class HomeController extends BaseController{


  List<Widget> pages =  [
    ShopView(),
    ExploreView(),
    CartView(),
    // FavouriteView(),
    AccountView(),
  ];
  int currentIndex = 0;

  void changeNavBarIndex(int index) {
    currentIndex = index;
    setState(ViewState.idel);
  }




}
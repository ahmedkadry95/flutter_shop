import 'package:flutter_shop/cart/base_cart_item.dart';
import 'package:flutter_shop/cart/base_cart_item_controller.dart';

class BaseCart {
  List<BaseCartItem>? items;
  BaseCart(this.items);

  BaseCart.fromJson(Map<String, dynamic> json) {
    this.items = BaseCartItemController.toBaseCartItems(json['items']);
  }
}

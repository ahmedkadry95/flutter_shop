import 'package:flutter_shop/product/base_product.dart';

abstract class BaseCartItem {
  BaseProduct? product;
  double? quantity;

  BaseCartItem(this.product, this.quantity);

  BaseCartItem.fromJson(Map<String, dynamic> json) {
    this.product = BaseProduct.fromJson(json['product']);
    this.quantity = json['quantity'];
  }
}

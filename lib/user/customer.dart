import 'package:flutter_shop/order/base_order.dart';
import 'package:flutter_shop/order/order_controller.dart';
import 'package:flutter_shop/product/base_product.dart';
import 'package:flutter_shop/product/product_controller.dart';
import 'package:flutter_shop/user/address.dart';
import 'package:flutter_shop/user/user.dart';

class Customer extends OldUser {
  Address? shippingAddress;
  Address? billingAddress;
  List<BaseProduct>? watchList;
  List<BaseOrder>? orders ;

  Customer(
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? gender,
    Address? shippingAddress,
    Address? billingAddress,
    List<BaseProduct>? watchList,
    List<BaseOrder>? orders,
  ) : super(id, firstName, lastName, email, phone, gender) {
    this.billingAddress;
    this.shippingAddress;
    this.watchList;
    this.orders;
  }

  Customer.fromJson(Map<String, dynamic> json)
      : super(
          json['id'],
          json['firstName'],
          json['lastName'],
          json['email'],
          json['phone'],
          json['gender'],
        ) {
    this.shippingAddress = Address.fromJson(json['shipping_address']);
    this.billingAddress = Address.fromJson(json['billing_address']);
    this.watchList = ProductController.toProducts(json['watch_list']);
    this.orders = OrderController.toOrders(json['orders']);
  }
}

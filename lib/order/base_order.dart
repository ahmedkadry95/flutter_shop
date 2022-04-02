import 'package:flutter_shop/cart/base_cart.dart';
import 'package:flutter_shop/payment/baser_payment.dart';
import 'package:flutter_shop/user/customer.dart';

class BaseOrder {
  BaseCart? cart;
  Customer? customer;
  BasePayment? payment;

  BaseOrder(this.cart, this.customer, this.payment);

  BaseOrder.fromJson(Map<String, dynamic> json) {
    this.customer = Customer.fromJson(json['customer']);
    this.cart = BaseCart.fromJson(json['cart']);
    this.payment = BasePayment.fromJson(json['payment']);
  }
}

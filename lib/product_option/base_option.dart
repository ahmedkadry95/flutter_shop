import 'dart:convert';

class BaseProductOption {
  String? name, value, meta;

  double? price;

  BaseProductOption(this.name, this.value, this.meta, this.price);

  BaseProductOption.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.value = json['value'];
    this.meta = json['meta'];
    this.price = json['price'];
  }
}

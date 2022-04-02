import 'package:flutter_shop/category/base_category.dart';
import 'package:flutter_shop/category/category_conttroler.dart';
import 'package:flutter_shop/discount/base_discount.dart';
import 'package:flutter_shop/discount/discount_controller.dart';
import 'package:flutter_shop/image/base_image.dart';
import 'package:flutter_shop/image/image_controller.dart';
import 'package:flutter_shop/product_option/base_option.dart';
import 'package:flutter_shop/product_option/base_option_controller.dart';
import 'package:flutter_shop/tag/base_tag.dart';
import 'package:flutter_shop/tag/tag_controller.dart';

 class BaseProduct {
  String? id, title, description;
  double? price;
  double? quantity;
  List<BaseImage>? images;
  List<BaseDiscount>? discounts;
  List<BaseCategory>? categories;
  List<BaseTag>? tag;
  List<BaseProductOption>? options;

  BaseProduct(
    this.id,
    this.title,
    this.description,
    this.price,
    this.quantity,
    this.images,
    this.discounts,
    this.categories,
    this.tag,
    this.options,
  );

  BaseProduct.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.description = json['description'];
    this.price = json['price'];
    this.quantity = json['quantity'];
    this.images = ImageController.toImages(json['images']);
    this.discounts = DiscountController.toDiscounts(json['discounts']);
    this.categories = CategoryController.toCategories(json['categories']);
    this.tag = TagController.toTags(json['tags']);
    this.options = BaseOptionController.toOptions(json['options']);
  }
}

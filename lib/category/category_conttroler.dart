import 'package:flutter/foundation.dart';
import 'package:flutter_shop/category/base_category.dart';

class CategoryController {
  Category category;

  CategoryController(this.category);

  static List<BaseCategory> toCategories(List<Map<String, dynamic>> json) {
    return [];
  }
}

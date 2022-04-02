import 'package:flutter_shop/product_option/base_option.dart';

class BaseOptionController {
  BaseProductOption baseProductOption;

  BaseOptionController(this.baseProductOption);

  static List<BaseProductOption> toOptions(List<Map<String, dynamic>> json) {
    return [];
  }
}

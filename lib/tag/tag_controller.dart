import 'package:flutter_shop/tag/base_tag.dart';

class TagController {
  BaseTag tag;

  TagController(this.tag);

  static List<BaseTag> toTags(List<Map<String, dynamic>> json) {
    return [];
  }
}

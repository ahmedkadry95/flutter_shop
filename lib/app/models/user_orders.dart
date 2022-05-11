class UserOrders {
  String? userId;
  List<OrderProducts>? products;

  UserOrders({required this.userId, required this.products});

  UserOrders.fromJson(json) {
    List<OrderProducts> productsFromJson = [];
    userId = json['userId'];
    if (json['products'] != null) {
      json['products'].forEach((product) {
        productsFromJson.add(OrderProducts.fromJson(product));
      });
    }
    products = productsFromJson;
  }

  toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['products'] = products?.map((v) => v.toJson()).toList();
    return data;
  }
}

class OrderProducts {
  String? title;
  int? count;

  OrderProducts({required this.title, required this.count});

  OrderProducts.fromJson(Map json) {
    title = json['title'];
    count = json['count'];
  }

  toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}

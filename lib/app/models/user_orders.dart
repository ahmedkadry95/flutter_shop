class UserOrders {
  String? userId;
  String? orderId;
  List<OrderProducts>? products;
  String? orderState;
  double? lat, long;

  UserOrders({
    required this.userId,
    required this.products,
    required this.orderId,
    required this.orderState,
    required this.lat,
    required this.long,
  });

  UserOrders.fromJson(json) {
    List<OrderProducts> productsFromJson = [];
    userId = json['userId'];
    // if (json['products'] != null) {
    //   json['products'].forEach((product) {
    //     productsFromJson.add(OrderProducts.fromJson(product));
    //   });
    // }
    products = json['products'] != null
        ? json['products'].forEach((product) {
            productsFromJson.add(OrderProducts.fromJson(product));
          })
        : [];
    products = productsFromJson;
    orderState = json['order_state'];
    lat = json['lat'];
    long = json['long'];
  }

  toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['products'] = products?.map((v) => v.toJson()).toList();
    data['order_id'] = orderId;
    data['order_state'] = orderState;
    data['lat'] = lat;
    data['long'] = long;
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

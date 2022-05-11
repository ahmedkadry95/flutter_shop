


class UserOrders {
  String? userId;
  List<OrderProducts>? products;

  UserOrders(this.userId, this.products);

  factory UserOrders.fromJson(json) {
    return UserOrders(
      json['userId'],
      json['products'],
    );
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

  OrderProducts(this.title, this.count);

  toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}

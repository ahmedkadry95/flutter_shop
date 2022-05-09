class OrderModel {
  String? id;
  List<Order>? order;

  OrderModel({
    this.id,
    this.order,
  });

  OrderModel.fromJson(json) {
    id = json['id'];
    order = json['id'];
  }

  orderModelToJson({
    required String id,
    required List order,
  }) {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['order'] = order;
    return data;
  }
}

class Order {
  String? title;
  int? count;

  Order({
    this.title,
    this.count,
  });

  Order.fromJson(json) {
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> orderToJson({
    required String title,
    required int count,
  }) {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}

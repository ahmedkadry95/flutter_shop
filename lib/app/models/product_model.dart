class ProductModel {
  String? id, title, description, image, category, measurementUnit;
  double? price, quantity;
  int? storage, count, soldTimes;

  double? totalPrice = 1;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.category,
    this.measurementUnit,
    this.price,
    this.quantity,
    this.storage,
    this.count,
    this.soldTimes,
  });

  ProductModel.fromJason(json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
    measurementUnit = json['measurement_unit'];
    price = json['price'];
    quantity = json['quantity'];
    storage = json['storage'];
    count = json['count'];
    soldTimes = json['sold_times'];
  }

  Map<String, dynamic> productToJson({
    required String? id,
    required String title,
    required String description,
    required String image,
    required String category,
    required String measurementUnit,
    required double price,
    required double quantity,
    required int storage,
    required int count,
    required int soldTimes,
  }) {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['category'] = category;
    data['measurement_unit'] = measurementUnit;
    data['price'] = price;
    data['quantity'] = quantity;
    data['storage'] = storage;
    data['count'] = count;
    data['sold_times'] = soldTimes;
    return data;
  }
}

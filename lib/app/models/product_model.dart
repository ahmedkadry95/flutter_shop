class ProductModel {
  String? id, title, description, image, category, measurementUnit;
  double? price, quantity;
  int? storage, count, soldTimes;
  bool? isExclusive;
  double? totalPrice = 1;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.measurementUnit,
    required this.price,
    required this.quantity,
    required this.storage,
    required this.count,
    required this.soldTimes,
  });

  factory ProductModel.fromJason(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      measurementUnit: json['measurement_unit'],
      price: json['price'].toDouble(),
      quantity: json['quantity'].toDouble(),
      storage: json['storage'],
      count: json['count'],
      soldTimes: json['sold_times'],
    );
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
    // required int isExclusive,
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
    // data['is_exclusive'] = isExclusive;
    return data;
  }
}

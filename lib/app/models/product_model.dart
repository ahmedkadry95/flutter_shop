class ProductModel {
  String? id, title, description, image, category, measurementUnit, quantity;

  double? storage, price;

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
  });

  ProductModel.fromJason(json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
    measurementUnit = json['measurement_unit'];
    price = json['price'];
    quantity = json['double'];
    storage = json['storage'];
  }

  Map<String, dynamic> toJson({
    required String? id,
    required String title,
    required String description,
    required String image,
    required String category,
    required String measurementUnit,
    required double price,
    required double quantity,
    required double storage,
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
    data['storage'] = storage;
    data['sold_times'] = 0;
    return data;
  }
}

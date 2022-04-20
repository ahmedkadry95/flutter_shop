class UserModel {
  String? email, id, mobile, userName, imageUrl;
  Map? address;

  UserModel({
    required this.email,
    required this.id,
    required this.mobile,
    required this.userName,
    required this.imageUrl,
    required this.address,
  });

  UserModel.fromJson(json) {
    email = json['email'];
    id = json['id'];
    mobile = json['mobile'];
    userName = json['user_name'];
    imageUrl = json['image_url'];
    address = json['address'];
  }

  userModelToJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['id'] = id;
    data['mobile'] = mobile;
    data['user_name'] = userName;
    data['image_url'] = imageUrl;
    data['address'] = address;
    return data;
  }
}

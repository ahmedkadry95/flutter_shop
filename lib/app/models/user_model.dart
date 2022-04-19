class UserModel {
  String? email, id, mobile, userName;
  Address? address;

  UserModel({this.email, this.id, this.mobile, this.userName, this.address});

  UserModel.fromJson(json) {
    email = json['email'];
    id = json['id'];
    mobile = json['mobile'];
    userName = json['user_name'];
    address = json['address'];
  }


  userModelToJson(){
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['id'] = id;
    data['mobile'] = mobile;
    data['userName'] = userName;
    return data;
  }

}

class Address {
  String? city, street, buildingNum;

  Address({this.city, this.street, this.buildingNum});

  Address.fromJson(Map json) {
    city = json['city'];
    street = json['street'];
    buildingNum = json['building_num'];
  }

  addressToMap() {
    final Map<String, dynamic> data = {};
    data['city'] = city;
    data['street'] = street;
    data['building_num'] = buildingNum;
    return data;
  }
}

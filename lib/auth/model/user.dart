
class CustomUser {
  String? userName;
  String? mobile;
  String? email;
  String? id;
  String? type;


  CustomUser({
    this.userName,
    this.mobile,
    this.email,
    this.id,
    this.type,
  }); //

  CustomUser.fromJson(Map<String, dynamic> json) {
    this.userName = json['user_name'];
    this.mobile = json['mobile'];
    this.email = json['email'];
    this.id = json['id'];
    this.type = json['type'];
  }

  toJason({
    required String userName,
    required String mobile,
    required String email,
    required String id,
    required String type,
  }) {
    final Map<String, dynamic> data = {};
    data['user_name'] = userName;
    data['mobile'] = mobile;
    data['email'] = email;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

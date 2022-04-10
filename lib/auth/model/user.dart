class User {
  String? userName;
  String? mobile;
  String? email;
  String? id;

  User(
    this.userName,
    this.mobile,
    this.email,
    this.id,
  );

  User.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    mobile = json['mobile'];
    mobile = json['email'];
    mobile = json['id'];
  }
}

import 'package:flutter_shop/user/address.dart';

abstract class User {
  String? id, firstName, lastName, email, phone, gender;

  User(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
  );
}

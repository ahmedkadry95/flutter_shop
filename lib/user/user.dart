import 'package:flutter_shop/user/address.dart';

abstract class OldUser {
  String? id, firstName, lastName, email, phone, gender;

  OldUser(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
  );
}

import 'package:flutter_shop/user/user.dart';

class Authenticatable {
  Future<OldUser>? register(String email, String password) {
    return null;
  }

  Future<bool>? login(String email, String password) {
    return null;
  }

  Future<bool>? resetPassword(String email) {
    return null;
  }

  Future<OldUser>? updateProfile(OldUser user) {
    return null;
  }
}

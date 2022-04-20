import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

import 'shared_pref_services.dart';

class ApiServices {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  UserCredential? userCredential;

  Future<String> registerUser({
    required String email,
    required String password,
    required String mobile,
    required String userName,
    required String city,
    required String street,
    required String buildingNum,
    required BuildContext context,
  }) async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await addUser(
        mobile: mobile,
        userName: userName,
        id: userCredential?.user!.uid,
        email: email,
        address: {
          'city': city,
          'street': street,
          'building_number': buildingNum,
        },
      );
      return 'user add successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'this password is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'this email is already exist';
      }
    } catch (e) {
      print(e);
    }
    return 'failed';
  }

  addUser({
    required String? userName,
    required String? mobile,
    required String? email,
    required String? id,
    required Map? address,
  }) {
    UserModel user = UserModel(
      email: email,
      id: id,
      mobile: mobile,
      userName: userName,
      imageUrl: '',
      address: address,
    );
    return users
        .doc(id)
        .set(
          user.userModelToJson(),
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'true';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    return 'false ';
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:http/http.dart' as http;

import 'shared_pref_services.dart';

class ApiServices {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference cartRef = FirebaseFirestore.instance.collection('cart');
  UserCredential? userCredential;

  Future<String> registerUser({
    required String email,
    required String password,
    required String mobile,
    required String userName,
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
  }) {
    UserModel user = UserModel(
      email: email,
      id: id,
      mobile: mobile,
      userName: userName,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/flutter-shop95.appspot.com/o/users_images%2Fuser.png?alt=media&token=d638ebde-3ab3-43d5-86c5-8378d7507975',
    );

    return users
        .doc(id)
        .set(
          user.userModelToJson(),
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> signInWithEmailAndPassword({
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

  // Future<void> sendPushMessage() async {
  //   try {
  //     await http.post(
  //       Uri.parse('https://api.rnfirebase.io/messaging/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: constructFCMPayload(_token),
  //     );
  //     print('FCM request for device sent!');
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

String constructFCMPayload(String? token) {
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification  was created via FCM!',
    },
  });
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/app/auth/model/user.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

import 'shared_pref_services.dart';

class ApiServices {
  var pref = locator<SharedPrefServices>();
  var navigation = locator<NavigationService>();

  CustomUser user = CustomUser();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  UserCredential? userCredential;

  registerUser({
    required String email,
    required String password,
    required String mobile,
    required String userName,
    required BuildContext context,
  }) async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addUser(
        type: 'user',
        mobile: mobile,
        userName: userName,
        id: userCredential?.user!.uid,
        email: email,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.TOPSLIDE,
          title: 'warning',
          desc: 'your password  is too weak ',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,
          title: 'error',
          desc: 'this email is already exist ',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }
    } catch (e) {
      print(e);
    }
  }

  addUser({
    required String? userName,
    required String? mobile,
    required String? email,
    required String? id,
    required String? type,
  }) {
    return users
        .doc(id)
        .set(
          user.toJason(
            userName: userName!,
            id: id!,
            email: email!,
            mobile: mobile!,
            type: type!,
          ),
        )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setUserToken(token: userCredential!.user!.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  setUserToken({required String token}) async {
    await pref.saveString(
      'token',
      token,
    );
  }

  setIsLogIn(bool value) async {
    await pref.saveBoolean('is_log_in', value);
  }
}

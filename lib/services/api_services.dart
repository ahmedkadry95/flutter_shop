import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/model/user.dart';

class ApiServices {
  CustomUser user = CustomUser();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserCredential? userCredential;

  registerUser({
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
        type: 'user',
        mobile: mobile,
        userName: userName,
        id: userCredential?.user!.uid,
        email: email,
      );
      print('=====================');
      print(userCredential?.user!.uid);
      print('+++++++++++++++++++++');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
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
        .add(
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

  login({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('userCredential!.user!.uid.isEmpty');
      print(userCredential!.user!.uid.isEmpty);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

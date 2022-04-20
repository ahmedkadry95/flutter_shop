import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/base_controller.dart';

class AddDeliveryAddressController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  updateAddress() {
    var userId = currentUser?.uid;
    print(userId);
    userRef.doc(userId).update({
      'address': {},
    });
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_shop/app/models/user_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AccountController extends BaseController {
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance.currentUser;

  final storageRef = FirebaseStorage.instance.ref();

  List userImageList = [];

  UserModel? userData;

  String? userName = '';
  String? userEmail = '';
  String? userImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-shop95.appspot.com/o/users_images%2Fuser.png?alt=media&token=d638ebde-3ab3-43d5-86c5-8378d7507975';
  String? imageUrl;
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      navigation.navigateToAndClearStack(RouteName.splash);
    } catch (e) {
      print(e);
    }
  }

  getUserData() async {
    String? userId = currentUser?.uid;
    DocumentSnapshot documentSnapshot = await userRef.doc(userId).get();
    print(documentSnapshot.data());
    userData = UserModel.fromJson(documentSnapshot.data());
    userName = userData?.userName;
    userEmail = userData?.email;
    userImage = userData?.imageUrl;
    setState(ViewState.idel);
  }

  updateUserImage() async {
    //pick file
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      var imageName = basename(pickedFile.path);
      // upload image to fire storage
      var userImages = FirebaseStorage.instance.ref('users_images/$imageName');
      await userImages.putFile(_photo!);
      imageUrl = await userImages.getDownloadURL();
      await updateUser(imageUrl!);
      print(imageUrl);
      setState(ViewState.idel);
    }
  }

  Future<void> updateUser(String image) {
    return userRef.doc(currentUser?.uid).update({'image_url': image});
  }
}

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_shop/base_controller.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ShopController extends BaseController {
  final storageRef = FirebaseStorage.instance.ref();
  List<String> bannerList = [];

  test() {
    print('test');
  }

  getBanner() async {
    var ref = await FirebaseStorage.instance.ref('banner/').list();
    for (var element in ref.items)  {
      var url = await element.getDownloadURL();
      print(
          '==============================================\n====================================');
      print(url);
      print(
          '==============================================\n====================================');
      bannerList.add(url);
    }
    print('bannerList ===== $bannerList');
  }

  void updateState() {
    setState(ViewState.idel);
  }
}

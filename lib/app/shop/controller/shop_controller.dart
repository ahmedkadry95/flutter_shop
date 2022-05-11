import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import 'package:geocoding/geocoding.dart';

import '../../../utils/strings.dart';

class ShopController extends BaseController {
  final storageRef = FirebaseStorage.instance.ref();
  var pref = locator<SharedPrefServices>();

  CollectionReference exclusiveOfferRef =
      FirebaseFirestore.instance.collection('exclusive_offer');
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  List<String> bannerList = [];
  List<ProductModel> bestSelling = [];
  List<ProductModel> bestSellingList = [];
  List<ProductModel> allProductList = [];
  List<ProductModel> exclusiveOfferList = [];

  String city = '';
  String street = '';

  getBanner() async {
    var ref = await FirebaseStorage.instance.ref('banner/').list();
    for (var element in ref.items) {
      var url = await element.getDownloadURL();
      bannerList.add(url);
    }
  }

  getAllProduct() async {
    QuerySnapshot querySnapshot = await productsRef.get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      allProductList.add(ProductModel.fromJason(element.data()));
    }
    allProductList.sort((a, b) => a.soldTimes!.compareTo(b.soldTimes!));
    allProductList.reversed;
    for (var i in allProductList) {
      print(i.soldTimes);
      print(i.title);
    }

    getExclusiveOfferList();
  }

  getExclusiveOfferList() {
    exclusiveOfferList = allProductList.where((isExclusive) => true).toList();
  }

  // getBestSelling() async {
  //   allProductList.reversed;
  //   var i = 0;
  //   do {
  //     bestSellingList.add(allProductList[i]);
  //     i++;
  //   } while (bestSellingList.length < 20);
  //
  //   print('bestSellingList');
  //   print(bestSellingList);
  //   print('///////////////////////////////////');
  //   setState(ViewState.idel);
  //
  //   //
  //   // QuerySnapshot querySnapshot = await productsRef
  //   //     .orderBy('sold_times', descending: true)
  //   //     .limit(12)
  //   //     .get();
  //   // List<QueryDocumentSnapshot> data = querySnapshot.docs;
  //   // for (var element in data) {
  //   //   bestSelling.add(ProductModel.fromJason(element.data()));
  //   // }
  //   // setState(ViewState.idel);
  // }

  getLocation() async {
    double lat = await pref.getDouble(latitude);
    double long = await pref.getDouble(longitude);
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, long);
    city = placeMarks[0].name!;
    street = placeMarks[0].street!;
  }

  updateState() {
    setState(ViewState.idel);
  }
}

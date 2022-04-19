import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';
import '../../../utils/strings.dart';

class ShopController extends BaseController {
  final storageRef = FirebaseStorage.instance.ref();
  var pref = locator<SharedPrefServices>();

  CollectionReference exclusiveOfferRef =
      FirebaseFirestore.instance.collection('exclusive_offer');
  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  List<String> bannerList = [];
  List<ProductModel> exclusiveOfferList = [];
  List<ProductModel> bestSelling = [];

  String city = '';
  String street = '';

  getBanner() async {
    var ref = await FirebaseStorage.instance.ref('banner/').list();
    for (var element in ref.items) {
      var url = await element.getDownloadURL();
      bannerList.add(url);
    }
    setState(ViewState.idel);
  }

  getExclusiveOffer() async {
    QuerySnapshot querySnapshot = await exclusiveOfferRef.get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      print(element.data().runtimeType);
      exclusiveOfferList.add(ProductModel.fromJason(element.data()));
    }
    setState(ViewState.idel);
  }

  getBestSelling() async {
    QuerySnapshot querySnapshot = await productsRef
        .orderBy('sold_times', descending: true)
        .limit(12)
        .get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      print(element.data().runtimeType);
      bestSelling.add(ProductModel.fromJason(element.data()));
    }
    print(bestSelling);
    print(bestSelling.length);
    setState(ViewState.idel);
  }

  getLocation() async {
    double lat = await pref.getDouble(latitude);
    double long = await pref.getDouble(longitude);
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, long);
    city = placeMarks[0].name!;
    street = placeMarks[0].street!;
    setState(ViewState.idel);
  }
}

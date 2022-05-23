import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_shop/app/models/product_model.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class ShopController extends BaseController {
  final storageRef = FirebaseStorage.instance.ref();
  var pref = locator<SharedPrefServices>();

  CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  CurrentSessionService currentSessionService = CurrentSessionService();
  List<String> bannerList = [];
  List<ProductModel> bestSellingList = [];
  List<ProductModel> allProductList = [];
  List<ProductModel> exclusiveOfferList = [];


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
    setState(ViewState.idel);
    getExclusiveOfferList();
  }

  getExclusiveOfferList() {
    exclusiveOfferList = allProductList.where((isExclusive) => true).toList();
  }

  getBestSelling() async {
    QuerySnapshot querySnapshot = await productsRef
        .orderBy('sold_times', descending: true)
        .limit(12)
        .get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      bestSellingList.add(ProductModel.fromJason(element.data()));
    }
    setState(ViewState.idel);
  }

  updateState() {
    setState(ViewState.idel);
  }

  getOrderIdFromPref() async{
      currentSessionService.currentOrderId = await pref.getString('currentOrderId');
      if(currentSessionService.currentOrderId == '' ){
        print('currentSessionService.currentOrderId ${currentSessionService.currentOrderId}');
      }
      setState(ViewState.idel);
  }

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class LastOrdersController extends BaseController {
  var navigation = locator<NavigationService>();
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  var currentUser = FirebaseAuth.instance.currentUser;

  List lastOrdersList = [];

  getLastOrders() async {
    QuerySnapshot querySnapshot =
        await ordersRef.where('id', isEqualTo: currentUser!.uid).get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    for (var element in data) {
      lastOrdersList.add(element.data());
    }

    List orderList = [];
    print('=====================================');
    print(lastOrdersList);
    print(lastOrdersList.length);
    print(lastOrdersList[1]['order']);

    for (var x in lastOrdersList[1]['order']) {
      orderList.add(Order.fromJson(lastOrdersList[x]['order']));
    }

    // var y = 0;
    // for (var x = 0; x < lastOrdersList.length; x++) {
    //   orderList.add(Order.fromJson(lastOrdersList[x]['order']));
    // }
    //
    // print(orderList);
    // print('=====================================');

    setState(ViewState.idel);
  }
}

class Order {
  int? count;
  String? title;

  Order.fromJson(Map json) {
    count = json['count'];
    title = json['title'];
  }
}

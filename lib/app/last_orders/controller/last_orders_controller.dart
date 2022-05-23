import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/enums/screen_state.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/navigation_service.dart';

class LastOrdersController extends BaseController {
  var navigation = locator<NavigationService>();
  CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');
  var currentUser = FirebaseAuth.instance.currentUser;

  List<UserOrders> lastOrdersList = [];

  getLastOrders() async {
    QuerySnapshot querySnapshot =
        await ordersRef.where('user_id', isEqualTo: currentUser!.uid).get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    var x = 0;
    for (var element in data) {
      lastOrdersList.add(UserOrders.fromJson(element.data()));
      print(x++);
    }
    print('last Orders');
    setState(ViewState.idel);
  }
}

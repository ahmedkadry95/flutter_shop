import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/services/current_session_service.dart';

class TrackOrderController extends BaseController {
  CurrentSessionService currentSessionService = CurrentSessionService();
  CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');

  Future<Stream<Object?>?> getCurrentOrder() async {
    QuerySnapshot querySnapshot = await orderRef
        .where('order_id', isEqualTo: currentSessionService.currentOrderId)
        .get();
    List<QueryDocumentSnapshot> data = querySnapshot.docs;
    return
  }
}

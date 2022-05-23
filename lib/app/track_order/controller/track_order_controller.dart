import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/base_controller.dart';
import 'package:flutter_shop/locator.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/services/navigation_service.dart';
import 'package:flutter_shop/services/shared_pref_services.dart';

class TrackOrderController extends BaseController {
  CurrentSessionService currentSessionService = CurrentSessionService();
  var navigation = locator<NavigationService>();

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('orders').snapshots();
  var pref = locator<SharedPrefServices>();


  updateState() async {
    currentSessionService.currentOrderId = '';
    await pref.saveString('currentOrderId', '');
    print('currentOrderId rested success');
  }
}
